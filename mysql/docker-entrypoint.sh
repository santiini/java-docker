#!/bin/bash
mysql -uroot -proot <<EOF
source /usr/local/sell-schema.sql;
source /usr/local/sell-data.sql;