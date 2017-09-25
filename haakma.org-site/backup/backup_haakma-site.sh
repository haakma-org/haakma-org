#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/haakma_site.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today/haakma.org
WWW_DIR=/home/sites

echo "***************************************************************"
echo "* Commence backup www.haakma.org                              *"
echo "***************************************************************"

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT} > ${BASE_DIR}/${DATE}_haakma.sql

echo "[INFO] Backup data directory : ${WWW_DIR}/wwww.haakma.org/"
tar -cvf ${BASE_DIR}/${DATE}_haakma.tar ${WWW_DIR}/www.haakma.org/

echo "***************************************************************"