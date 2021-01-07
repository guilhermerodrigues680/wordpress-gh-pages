#!/bin/bash

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

WORDPRESS_DIR_BACKUP_FILE="wordpress-dir.tar.bz2"
WORDPRESS_DB_BACKUP_FILE="wordpress-db.backup.sql.bz2"

echo "Iniciando docker mysql service..."
docker-compose up -d mysql

echo "Removendo backup anterior"
rm -rf $WORDPRESS_DIR_BACKUP_FILE $WORDPRESS_DB_BACKUP_FILE

echo "Backup pasta wordpress"
tar cvfj $WORDPRESS_DIR_BACKUP_FILE wordpress

echo "Backup banco"
docker-compose exec -T mysql mysqldump -u root -p wordpress | bzip2 -cz > $WORDPRESS_DB_BACKUP_FILE

echo "OK!"
