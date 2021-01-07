#!/bin/bash

read -p "O script apagara todos dados do ambiente anterior. Tem certeza? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

WORDPRESS_DIR_BACKUP_FILE="wordpress-dir.tar.bz2"
WORDPRESS_DB_BACKUP_FILE="wordpress-db.backup.sql.bz2"
HOST_WORDPRESS="http://ip172-18-0-59-bvrnojhlo55000eqi7m0-80.direct.labs.play-with-docker.com"

echo "Limpando ambiente atual"
docker-compose down --rmi local
rm -rf db_data wordpress

echo "Iniciando docker mysql service..."
docker-compose up -d mysql

echo "Restaurando banco..."
cat $WORDPRESS_DB_BACKUP_FILE | bzip2 -ckd | docker-compose exec -T mysql mysql -u root -p"toor" wordpress

echo "Restaurando wp-content..."
tar -xvf $WORDPRESS_DIR_BACKUP_FILE && chmod -R 767 wordpress

echo "Configurando host wordpress..."
docker-compose exec -T mysql mysql -u root -p"toor" wordpress <<< "use wordpress; UPDATE wp_options SET option_value = '${HOST_WORDPRESS}' WHERE wp_options.option_id = 1 OR wp_options.option_id = 2;"

echo "Iniciando docker wordpress service..."
docker-compose up -d wordpress

echo "Iniciando docker phpmyadmin service..."
docker-compose up -d phpmyadmin

echo "OK!"
