#!/bin/bash

DATE=`date +%Y-%m-%d`

mysqldump -pKoRn0512 haakma > /home/sido/backup/today/${DATE}_haakma.sql

tar -cvf /home/sido/backup/today/${DATE}_haakma.tar /srv/www/haakma.org/
