#!/bin/bash

BASE_PATH=`pwd`

DATE=`date +%Y-%m-%d`
BASE_DIR=/home/backup/haakma.org/today

FTP_CONFIG_DIR=/home/config/vsftpd

echo "***************************************************************"
echo "* Commence backup ftp.haakma.org                              *"
echo "***************************************************************"

echo "[INFO] Backup FTP-configuration : ${FTP_CONFIG_DIR}"
tar -cvf ${BASE_DIR}/${DATE}_haakma_vsftpd.tar ${FTP_CONFIG_DIR}

echo "***************************************************************"





