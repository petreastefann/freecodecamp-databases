#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

# create user
USER(){
  # generate random nb
  RAND_NB=$(( $RANDOM % 1000 + 1 ))
  # enter user and check for existence
  echo -e "\nEnter your username: "
  read USERNAME
  USER=$($PSQL "select username, games, best from games where username = '$USERNAME';")
  if [[ -z $USER ]];
  then
    # new user message
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    echo -e "\nGuess the secret number between 1 and 1000: \n"
    TRIES=1
    GAME $RAND_NB $USERNAME $TRIES
  else
    # welcome back message
    echo $USER | while read USERNAME BAR GAMES BAR BEST
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
    done
    echo -e "\nGuess the secret number between 1 and 1000: \n"
    TRIES=1
    GAME $RAND_NB $USERNAME $TRIES
  fi
  # play game
  # echo -e "\nGuess the secret number between 1 and 1000: \n"
  # TRIES=1
  # GAME $RAND_NB $USERNAME $TRIES
}

# play the game
GAME(){
  # get tries = 1
  # TRIES=1
  # read number from keyboard
  read NUMBER 
  # check if input is number
  if [[ ! $NUMBER =~ ^[0-9]+$ ]];
  then
    echo -e "\nThat is not an integer, guess again: \n";
    GAME $RAND_NB $USERNAME $TRIES
  else
    # check if input is smaller
    if [[ "$NUMBER" < $RAND_NB ]];
    then
      echo -e "\nIt's higher than that, guess again: \n"
      ((TRIES=$TRIES+1))
      GAME $RAND_NB $USERNAME $TRIES
    # check if input is greater
    elif [[ "$NUMBER" > $RAND_NB ]];
    then
      echo -e "\nIt's lower than that, guess again: \n"
      ((TRIES=$TRIES+1))
      GAME $RAND_NB $USERNAME $TRIES
    # check if input is equal
    else
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $RAND_NB. Nice job!"
      # insert data into database
      INSERT $USERNAME $TRIES
    fi
  # increment tries
  # ((TRIES=$TRIES+1))
  fi
}

# insert game data into database
INSERT() {
  # get data from games
  USER_DATA=$($PSQL "SELECT username, games, best FROM games")
  echo $USER_DATA | while read USER_NAME BAR GAMES BAR BEST
  do
    # check if user exists
    USER_EXISTS=$($PSQL "SELECT username FROM games WHERE username = '$USERNAME'")
    if [[ -z $USER_EXISTS ]];
    # insert user if not exists
    then
      INSERT_NEW=$($PSQL "INSERT INTO games(username, games, best) VALUES('$USERNAME', 1, $TRIES)")
      # update user if exists and check if current score is record
    else
      # update nb of games if current 'tries' is higher than record
      if [[ $BEST > $TRIES ]];
      then
        INSERT_GAME=$($PSQL "UPDATE games SET games = games + 1 WHERE username='$USERNAME'")
      # update nb of games and best if 'tries' is lower than record
      else
        INSERT_NEW_RECORD=$($PSQL "UPDATE games SET (games, best) = (games + 1, $TRIES) WHERE username = '$USERNAME'")
      fi
    fi
  done
}


USER