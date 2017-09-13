#!/bin/bash

SQL_PASSWORD=${1}
SQL_SCHEMA=${2}

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today

mysqldump -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_haakma.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma.tar /srv/www/haakma.org/
