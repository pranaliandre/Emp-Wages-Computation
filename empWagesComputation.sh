#!/bin/bash -x
IS_PART_TIME=1;
IS_FULLTIME=2
IS_ABSENT=0;
MAX_HRS_IN_MONTH=10;
EMP_RATE_PER_HR=20;
NUM_OF_WORKING_DAYS=20;
#variable
empSalary=0;
totalEmpHours=0;
totalWorkingDays=0;
empHrs=0;
empMonthlyWages=0;

#calculating wages till no of working days and hours using function
function getDailyWorkingHours(){
   case $1 in
      $IS_FULL_TIME)
         empHrs=8
         ;;
      $IS_PART_TIME)
         empHrs=4
         ;;
      $IS_ABSENT)
         empHrs=0
         ;;
   esac
echo $empHrs
}

#Calculationg Daily wage along with monthly wage
while [[ $totalWorkingDays -le $NUM_OF_WORKING_DAYS && $totalEmpHours -le $MAX_HRS_IN_MONTH ]]
do
   
	empHrs=$( getDailyWorkingHours $((RANDOM%3)) )
	totalEmpHours=$((totalEmpHours+$empHrs))
	((totalWorkingDays++))
	dailyWage=$((empHrs*EMP_RATE_PER_HR))
	dailyWage[$totalWorkingDays]=$dailyWage
	empMonthlyWage=$(($empMonthlyWage+$dailyWage))
done
echo ${dailyWage[@]}
echo "${!empMonthlyWage[@]}" value="${empMonthlyWage[@]}"

