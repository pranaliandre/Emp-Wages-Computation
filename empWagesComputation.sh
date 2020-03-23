#!/bin/bash -x
echo "Welcome to Employee wages computation"
#Function to check employee is present or abcent
function empAttendance() {
	local empCheck=$(( RANDOM%2 ))
	if [ $empCheck -eq 1 ]
	then
		echo "employee is present"
	else
		echo "employee is absent"
	fi
}
empAttendance
