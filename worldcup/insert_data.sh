#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE games, teams;"

GET_TEAM_ID() {
  $PSQL "SELECT team_id FROM teams WHERE NAME = '$1';"
}

ADD_NEW_TEAM() {
  $PSQL "INSERT INTO teams(name) VALUES ('$1');"
}

sed '1d' games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  # Get winner team ID 
  WINNER_ID=$(GET_TEAM_ID "$WINNER")
  if [[ -z $WINNER_ID ]]; then
    INSERT_WINNER_RESULT=$(ADD_NEW_TEAM "$WINNER")

    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]; then
      echo -e "\n\tSuccessfully added a new team: $WINNER"
    fi
    WINNER_ID=$(GET_TEAM_ID "$WINNER")
  fi
  
  # Get opponent team ID
  OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")
  if [[ -z "$OPPONENT_ID" ]]; then
    INSERT_OPPONENT_RESULT=$(ADD_NEW_TEAM "$OPPONENT")

    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]; then
      echo -e "\n\tSuccessfully added new team: $OPPONENT"
    fi

    OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")
  fi

  # insert into games
  INSERT_GAMES_RESULT=$(
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);"
  )
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]; then
    echo -e "\nInserted game: $WINNER VS $OPPONENT"
  fi
done
