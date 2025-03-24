# Bash Script mongodb(No-sql) data base backup and archive policy like 30 day's:



#!/bin/bash


BACKUP_DIR="/path/to/backups"         
ARCHIVE_DIR="/path/to/archives"       
MONGO_DB="your_database_name"         
MONGO_HOST="localhost"            
MONGO_PORT="27017"                    
DATE=$(date +"%Y%m%d%H%M%S")          
RETENTION_DAYS=30                     
ARCHIVE_RETENTION_DAYS=90             


BACKUP_PATH="$BACKUP_DIR/backup_$DATE"
mkdir -p $BACKUP_PATH
mkdir -p $ARCHIVE_DIR
echo "Starting MongoDB backup..."
mongodump --host $MONGO_HOST --port $MONGO_PORT --db $MONGO_DB --out $BACKUP_PATH

# Check if the dump was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed. Exiting."
    exit 1
fi

# Archive backups older than 30 days (optional: tar or gzip)
echo "Archiving backups older than $RETENTION_DAYS days..."
find $BACKUP_DIR -type d -mtime +$RETENTION_DAYS -exec tar -czf $ARCHIVE_DIR/backup_$(basename {})_$(date +"%Y%m%d").tar.gz {} \;
