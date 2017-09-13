#!/bin/bash

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/sido/backup/today

mysqldump -pKoRn0512 haakma > ${BASE_DIR}/${DATE}_haakma_bouw.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_bouw.tar /srv/www/bouw.haakma.org/

