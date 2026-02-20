#!/bin/bash

PSQL="psql -X --tuples-only --username=freecodecamp --dbname=salon -c"

echo  -e "\n~~~~~ MY SALON ~~~~~\n"

MENU() {
  if [[ -z $1 ]]; then
    echo -e "Welcome to My Salon, how can I help you?"
  else
    echo -e "\n$1"
  fi

  GET_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$GET_SERVICES" | while IFS=' | ' read SERVICE_ID NAME; do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) DO_SERVICE "cut" ;;
    2) DO_SERVICE "color" ;;
    3) DO_SERVICE "perm" ;;
    4) DO_SERVICE "style" ;;
    5) DO_SERVICE "trim" ;;
    *) MENU "I could not find that service. What would you like today?"
  esac
}

DO_SERVICE() {
  SERVICE="$1"

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Retrieve name from phone
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # Add a new customer record if not exists
  if [[ -z $CUSTOMER_NAME ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  fi

  # Remove spaces in the name
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')

  # Retrieve customer_id 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  
  echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME
  
  # Add new appointment
  NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME');")
  if [[ $NEW_APPOINTMENT_RESULT == "INSERT 0 1" ]]; then
    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MENU

