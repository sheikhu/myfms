#!/bin/bash

if psql -lqt -h db -U fms | cut -d \| -f 1 | grep -w fms; then
    echo " ==> Database already exists"
else
    echo " ==> Creating database"
    psql -h db -U fms fms < /fms/db/schema.sql
    psql -h db -U fms fms < /fms/db/generate_secret.sql
    psql -h db -U fms fms < /fms/db/alert_types.sql
fi
