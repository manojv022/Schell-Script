# Bash Script postgres data base backup and archive policy like 30 day's:



#!/bin/bash

PGUSER="postgres"
PGPASSWORD="passwd"
PGHOST="localhost"
PGPORT="5432"
PGDATABASE="my_db"
BACKUP_DIR="/var/backup/postgres_backup"

mkdir -p "$/var/backup/postgres_backup"

CURRENT_DATE=$(date +"%Y%m%d")
BACKUP_FILE="$BACKUP_DIR/backup_mydb${PGDB}_${CURRENT_DATE}.sql"

# Dump the database
pg_dump -U "$PGUSER" -h "$PGHOST" -p "$PGPORT" "$PGDB" > "$BACKUO_FILE"


if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE"
else
  echo "Backup failed!" >&2
  exit 1
fi

# Archive backup files older than 30 days

find "$BACKUP_DIR" -type f -mtime +30 -exec tar -czf "$ARCHIVE_DIR/$(basename {} .sql)_$(date -r {} +"%Y%m%d").tar.gz" {} \;

 
if [ $? -eq 0 ]; then
  echo "Archive successful"
