#!/bin/bash

USER_INPUT="$1"
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

CHECK_ELEMENT() {
	if [[ "$USER_INPUT" =~ ^[0-9]+$ ]]; then
		CONDITION="atomic_number = $USER_INPUT"
	else
		CONDITION="name = '$USER_INPUT' OR symbol = '$USER_INPUT'"
	fi

	# query db
	RESPONSE=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $CONDITION LIMIT 1;")
	# print if no result found
	if [[ -z $RESPONSE ]]; then
		echo "I could not find that element in the database."
	# print result if found
	else
		echo $RESPONSE | while IFS='|' read NUMBER NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT; do
			echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
		done
	fi
}

if [[ -z $USER_INPUT ]]; then
	echo "Please provide an element as an argument."
	exit
else
	CHECK_ELEMENT
fi
