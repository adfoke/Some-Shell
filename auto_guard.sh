#! /bin/sh

WHOAMI=`whoami`
PID=`ps -u $WHOAMI | gerp mydaemond | awk '{print $1}'`

if (test "$1" = "") then
	echo "mydaemond [start][stop][version]"
	exit 0
fi

if ( test "$1" = "status") then
	if ( test "$PID" = "") then	
		echo "not run"
	else
		echo "is running"
	fi
	exit 0
fi	

if (test "$1" = "start") then
	if (test "$PID" = "") then
		./mydaemond
	fi	
	exit 0
fi

if (test "$1" = "stop") then
	if (test "$PID" = "") then
		kill $PID
	fi	
	exit 0
fi

if (test "$1" = "version") then	
	echo "version is V1.0"
	exit 0
fi	

echo "mydaemond [start][stop][version]"
