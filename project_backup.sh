#!/bin/bash

############################
# Configuration
############################

#TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
TIMESTAMP=$(date +"%F_%T")
LOG_FILE="$HOME/backup.log"

############################
# Input Handling
############################

SOURCE_DIR=${1:-$HOME}
# put any path you want as  default
#BACKUP_BASE_DIR=${2:-$SOURCE_DIR/backup}
#BACKUP_DIR="$BACKUP_BASE_DIR/$TIMESTAMP"
BACKUP_DIR=${2:-/home/Backup$SOURCE_DIR/$TIMESTAMP}

############################
# Logging Function
############################

log() {
    echo "[$(date +"%F %T")] $1" | tee -a "$LOG_FILE"
}

############################
# Validation
############################

if [ ! -d "$SOURCE_DIR" ]; then
    log "ERROR: Source directory does not exist "
    exit 1
fi

############################
# Backup Process
############################

log "Backup started"
log "Source      : $SOURCE_DIR"
log "Destination : $BACKUP_DIR"

mkdir -p "$BACKUP_DIR"

rsync -av --delete "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    log "Backup completed successfully "
    log "$"
else
    log "Backup failed "
    exit 1
fi
