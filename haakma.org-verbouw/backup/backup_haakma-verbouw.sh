#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/haakma_verbouw.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/haakma.org/today
WWW_DIR=/home/sites

echo "***************************************************************"
echo "* Commence backup verbouw.haakma.org                          *"
echo "***************************************************************"

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT} > ${BASE_DIR}/${DATE}_haakma_verbouw.sql

echo "[INFO] Backup data directory : ${WWW_DIR}/verbouw.haakma.org/"
tar -cvf ${BASE_DIR}/${DATE}_haakma_verbouw.tar ${WWW_DIR}/verbouw.haakma.org/

echo "***************************************************************"