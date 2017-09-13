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

echo "[INFO] Backup MySQL schema : ${SQL_SCHEMA}"
mysqldump -u ${SQL_USER} -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_haakma_mail.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_mail.tar ${WWW_DIR}/webmail.haakma.org/
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_postfix.tar ${POSTFIX_CONFIG_DIR}
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_dovecot.tar ${DOVECOT_CONFIG_DIR}
sudo tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_maildir.tar ${MAIL_DIR}/haakma.org





