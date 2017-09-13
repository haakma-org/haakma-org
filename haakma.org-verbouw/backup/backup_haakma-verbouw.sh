#!/bin/bash

. ../../utils/read_configuration.sh

read_config "/home/config/haakma_verbouw.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today
WWW_DIR=/home/sites

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_haakma_verbouw.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_verbouw.tar ${WWW_DIR}/verbouw.haakma.org/

