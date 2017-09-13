#!/bin/bash

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/sido/backup/today

mysqldump -pKoRn0512 haakma_mail > ${BASE_DIR}/${DATE}_haakma_mail.sql

tar -cvf ${BASE_DIR}/${DATE}_haakma_mail.tar /srv/www/webmail.haakma.org/
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_postfix.tar /etc/postfix/
tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_dovecot.tar /etc/dovecot/
sudo tar -cvf ${BASE_DIR}/${DATE}_haakma_mail_maildir.tar /srv/maildirs/haakma.org





