#!/bin/bash

#source /etc/profile     
#add into the file only if you got some error like- 
#-“nohup: failed to run command java: No such file or directory ”

BAK_DIR=/home/backup
DATE=`date +%Y%m%d%H%M`
RMDATE="5"
JARNAME=abc.jar
JARHOME=/home/abc

# Use kill -9 to shutdown wechat.server
ps -ef | grep ${JARNAME}  | grep -v grep | awk '{print $2}'  | xargs kill -9

#Backup
cd /${JARHOME}
mv ${JARNAME} ${BAK_DIR}/${DATE}-${JARNAME}
find ${BACKUP_DIR} -type f -mtime +${RMDATE} -exec rm -rf {} \;
echo "Backup finished!"

#Publish jarservices
cp /home/tmp/${JARNAME} /${JARHOME}/
nohup java -jar -Dspring.profiles.active=production /${JARHOME}/${JARNAME} >abc.out 2>&1 &
#nohup java -jar -Dspring.profiles.active=test /${JARHOME}/${JARNAME} >abc.out 2>&1 &


#Remove tmp
rm -rf /home/tmp/${JARNAME}
