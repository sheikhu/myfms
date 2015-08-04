#!/bin/bash
#if psql -lqt | cut -d \| -f 1 | grep -w fms; then
#if [[ `psql -h db -U fms -tAc "SELECT 1 FROM pg_database WHERE datname='fms'"` == "1" ]]; then
#  echo " ==> Found database"
#  if
    psql -h db -U fms fms < /fixmystreet/db/schema.sql
    psql -h db -U fms fms < /fixmystreet/db/generate_secret.sql
    psql -h db -U fms fms < /fixmystreet/db/alert_types.sql
#  else
#    echo " Imporing database schema"
#  fi
#  else
#    echo " ==> Database not found"
#fi
