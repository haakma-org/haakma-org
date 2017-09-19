#!/bin/bash

BASE_DIR=/home/backup

echo "***************************************************************"
echo "* Cleanup old backups                                         *"
echo "***************************************************************"
echo `find ${BASE_DIR}/today -iname "*" -mtime +7`
find ${BASE_DIR}/today -iname "*" -mtime +7 | xargs -I '{}' mv {} ${BASE_DIR}/old
echo "***************************************************************"
