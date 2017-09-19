#!/bin/bash

BASE_PATH=`pwd`

source ${BASE_PATH}/utils/read_configuration.sh

read_config "/home/config/haakma_webmail.properties"

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today
WWW_DIR=/home/sites
MAIL_DIR=/home/mail
POSTFIX_CONFIG_DIR=/home/config/postfix/
DOVECOT_CONFIG_DIR=/home/config/dovecot/

echo "***************************************************************"
echo "* Commence backup webmail.haakma.org                          *"
echo "***************************************************************"

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} --host=${SQL_HOST} --port=${SQL_PORT}  > ${BASE_DIR}/${DATE}_haakma_mail.sql

echo "[INFO] Backup data directory : ${WWW_DIR}/webmail.haakma.org/"
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail.tar ${WWW_DIR}/webmail.haakma.org/
echo "[INFO] Backup POSTFIX-configuration : ${POSTFIX_CONFIG_DIR}"
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_postfix.tar ${POSTFIX_CONFIG_DIR}
echo "[INFO] Backup DOVECOT-configuration : ${DOVECOT_CONFIG_DIR}"
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_dovecot.tar ${DOVECOT_CONFIG_DIR}
echo "[INFO] Backup mail data directory: ${MAIL_DIR}/haakma.org"
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_maildir.tar ${MAIL_DIR}/haakma.org

echo "***************************************************************"





