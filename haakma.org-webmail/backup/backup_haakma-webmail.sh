#!/bin/bash

SQL_PASSWORD=${1}
SQL_SCHEMA=${2}

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/today

mysqldump -p${SQL_PASSWORD} ${SQL_SCHEMA} > ${BASE_DIR}/${DATE}_haakma_mail.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_mail.tar /srv/www/webmail.haakma.org/
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_postfix.tar /etc/postfix/
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_dovecot.tar /etc/dovecot/
sudo tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_maildir.tar /srv/maildirs/haakma.org





