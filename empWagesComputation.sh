#!/bin/bash -x

#CONSTANTS
EMP_RATE_PER_HOUR=20
EMP_FULL_DAY_HOUR=8
EMP_PART_DAY_HOUR=4
IS_PRESENT=1
FULL_TIME_EMP=2
PART_TIME_EMP=1
NUM_OF_WORKING=20
#variables
wageForADay=0
totalWage
echo "Welcome to Employee wages computation"
function dailyEmpWage(){
   echo $(($1*$2))
}

#function of employee wages solve using case statement
function empCaseStatement(){
	local empCheck=$((RANDOM%3))
	case $empCheck in
		$EMP_FULL_DAY_HOUR)
			wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_FULL_DAY_HOUR )
			;;
		$EMP_PART_DAY_HOUR)
			wageForADay=$( dailyEmpWage  $EMP_RATE_PER_HOUR $EMP_PART_DAY_HOUR )
			;;
		*)
			wageForADay=0
			;;
		esac
}	
empCaseStatement

#function to calculate employee type, Full time or Part time
function employeeType(){
	local empType=$((RANDOM%3))
	if [ $empType -eq $FULL_TIME_EMP ]
	then
		wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_FULL_DAY_HOUR )
	elif [ $empType -eq $PART_TIME_EMP ]
	then
		wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_PART_DAY_HOUR )
	else
		wageForADay=0
	fi
}
employeeType
#function  calculated employee wages for a month
function wagesForAMonth(){
   for (( dayCount=1;dayCount<=NUM_OF_WORKING;dayCount++))
   do
		local empType=$((RANDOM%3))
		if [ $empType -eq $FULL_TIME_EMP ]
		then
			wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_FULL_DAY_HOUR )
		elif [ $empType -eq $PART_TIME_EMP ]
		then
			wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_PART_DAY_HOUR )
		else
			wageForADay=0
   	fi
		echo $wageForADay
		totalWage=$((totalWage+wageForADay)) #calculate the total salary of month
	done
}
wagesForAMonth

#function to calulate employee wages
# param1 : wages per hour
# param2 :  working hours of employee

empCheck=$((RANDOM%2))
if [ $IS_PRESENT -eq $empCheck ]
then
	wageForADay=$( dailyEmpWage $EMP_RATE_PER_HOUR $EMP_FULL_DAY_HOUR )
else
	wageForADay=0
fi
