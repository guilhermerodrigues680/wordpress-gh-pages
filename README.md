Senha

wordpres
user: root
senha: toor

phpmyadmin
user: root
senha: toor


tar cvfj wordpress-backup.tar.bz2 wordpress
tar -tvf wordpress-backup.tar.bz2 wordpress

docker-compose exec -T mysql mysqldump -u root -p wordpress > wordpress-db.backup.sql
docker-compose exec -T mysql mysqldump -u root -p wordpress | bzip2 -cz > wordpress-db.backup.sql.bz2
bzip2 -kd wordpress-db.backup.sql.bz2