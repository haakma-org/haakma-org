#!/bin/bash

SQL_PASSWORD=${1}
SQL_SCHEMA=${2}

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/sido/backup/today

mysqldump -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_haakma_verbouw.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_bouw.tar /srv/www/verbouw.haakma.org/

