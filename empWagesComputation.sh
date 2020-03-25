#!/bin/bash -x

#CONSTANTS
EMP_RATE_PER_HOUR=20
EMP_FULL_DAY_HOUR=8
IS_PRESENT=1

#variables
wageForADay

echo "Welcome to Employee wages computation"

#function to calulate employee wages
# param1 : wages per hour
# param2 :  working hours of employee
function dailyEmpWage(){
	echo $(($1*$2))
}
empCheck=$((RANDOM%2))
if [ $IS_PRESENT -eq $empCheck ]
then
	wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_FULL_DAY_HOUR )
else
	wageForADay=0
fi
