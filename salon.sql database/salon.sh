#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~ MY SALON ~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  echo -e "\nWelcome to my salon. Here are the services we currently hold:\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICES" | sed 's/|/ /g' | while read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  #enter service id
  echo "Please enter the id of the desired service (enter 0 to Exit):"
  read SERVICE_ID_SELECTED
  SERVICE_AVAILABILITY=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ $SERVICE_ID_SELECTED == 0 ]]
  then
    # if service if is 0 exit
    exit
  else
    # else check if service exists
    if [[ -z $SERVICE_AVAILABILITY ]]
    then
      # if yes recall main menu
      MAIN_MENU "The selected service does not exist, select again:"
    else
      # else
      echo "What's your phone number?"


      INSERT_CUSTOMER_PHONE(){
        # enter phone
        read CUSTOMER_PHONE
        # check if phone is null
        if [[ -z $CUSTOMER_PHONE ]]
        then
          # if yes recall customer phone
          echo "You didn't enter a phone number, try again:"
          INSERT_CUSTOMER_PHONE
        else
          # else check if phone exists in db
          PHONE_EXIST=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
          if [[ -z $PHONE_EXIST ]]
          then
            # if not insert name
            echo "There are no records for your phone number, what's your name?"



            INSERT_CUSTOMER_NAME(){
              read CUSTOMER_NAME 
              # check if name is not null
              if [[ -z $CUSTOMER_NAME ]]
              then
                # if null recall insert customer name
                echo "You didn't enter your name, try again:"
                INSERT_CUSTOMER_NAME
              else
                # else insert customer into the db
                REGISTER_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
              fi
            }
            INSERT_CUSTOMER_NAME
          else
            # if yes fetch name from earlier query
            CUSTOMER_NAME=$PHONE_EXIST
          fi
          # fetch service name from query
          SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | sed 's/^ *//g')
          # insert time of service
          echo -e "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"



          INSERT_SERVICE_TIME(){
            read SERVICE_TIME
            # check if service is null
            if [[ -z $SERVICE_TIME ]]
            then
              # if yes recall insert service time
              echo "You didn't enter an appointment time, try again:"
              INSERT_SERVICE_TIME
            else
              # fetch customer id and insert customer into appointments
              CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
              APP_REG=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
              # print requested message
              echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
            fi
          }
          INSERT_SERVICE_TIME
        fi
      }
      INSERT_CUSTOMER_PHONE
    fi
  fi
}


MAIN_MENU
