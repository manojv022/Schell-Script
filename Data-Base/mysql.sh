# Bash Script mysql data base backup and archive policy like 30 day's:

#!/bin/bash

DB_USER="manoj"
DB_PASSWORD="passwd"
DB_NAME="my_db"
ARCHIVE_DIR="/home/manoj/mysql-archives"
BACKUP_DIR="/home/manoj/mysql-bakup"
DATE=$(date +"20250322")
BACKUP_FILE="/home/manoj/mysql-bakup/backup_my_db_20250322.sql"


mysqldump -u $DB_USER -p $DB_PASSWORD $DB_NAME > $BACKUP_FILE

echo "Backup of database $mysql to $backup_my_db complete!"



if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Backup failed!"
    exit 1
fi


# Archive Policy For Backup File

find $BACKUP_DIR -type f -name "*.sql" -mtime +30 -exec tar -czf $ARCHIVE_DIR/mysql_bakup_$(date +"20250322").tar.gz {} \;

