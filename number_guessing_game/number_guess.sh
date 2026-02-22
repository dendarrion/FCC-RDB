#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( $RANDOM % 1001 ))

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT user_id, username, COUNT(guesses) AS games_played, MIN(guesses) AS best_game FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME' GROUP BY user_id, username LIMIT 1")
if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  IFS='|' read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

TRIES=0
GUESS() {
  if [[ -n $1 ]]; then
    echo "$1"
  fi
  read user_guess
  (( TRIES++ ))
  if [[ ! $user_guess =~ ^[0-9]+$ ]]; then
    GUESS "That is not an integer, guess again:"
  else
    if [[ $user_guess -eq $SECRET_NUMBER ]]; then
      echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id,guesses) VALUES($USER_ID, $TRIES)")
    elif [[ user_guess -lt SECRET_NUMBER ]]; then
      GUESS "It's higher than that, guess again:"
    else
      GUESS "It's lower than that, guess again:"
    fi
  fi
}

echo "Guess the secret number between 1 and 1000:"
GUESS
