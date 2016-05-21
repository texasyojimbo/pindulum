#!/bin/bash

PIN=$1
INITIAL_STATE=`cat /sys/class/gpio/gpio$PIN/value`
STATE=$INITIAL_STATE
INTERVAL=$2
COUNTER=0
LIMIT=$3
EXIT_CODE=$4

if [ -z $PIN ]
	then PIN=27
fi

if [ -z $INTERVAL ]
	then INTERVAL=1
fi

if [ -z $LIMIT ]
	then LIMIT=1000
fi	

if [ -z $EXIT_CODE ]
	then EXIT_CODE=0
fi

while [ $COUNTER -lt $LIMIT ]
	do
	#echo $STATE
	if [ $STATE = 0 ]
		then 
			echo 1 > /sys/class/gpio/gpio$PIN/value
			STATE=1
		else 
			echo 0 > /sys/class/gpio/gpio$PIN/value
			STATE=0
	COUNTER=`expr $COUNTER + 1`
	fi
	sleep $INTERVAL
	done

exit $EXIT_CODE

