#!/bin/bash

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/sido/backup/today

mysqldump -pKoRn0512 haakma_verbouw > ${BASE_DIR}/${DATE}_haakma_verbouw.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_bouw.tar /srv/www/verbouw.haakma.org/

