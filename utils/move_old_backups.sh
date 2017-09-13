#!/bin/bash

BASE_DIR=/home/sido/backup

find ${BASE_DIR}/today -iname "*" -mtime +7 | xargs -I '{}' mv {} ${BASE_DIR}/old

