#! /bin/bash
psql -h db -U fms fms < /fixmystreet/db/schema.sql
psql -h db -U fms fms < /fixmystreet/db/generate_secret.sql
psql -h db -U fms fms < /fixmystreet/db/fixture.sql

# reports
/fixmystreet/bin/update-all-reports