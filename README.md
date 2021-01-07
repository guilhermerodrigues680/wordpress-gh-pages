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

cat wordpress-db.backup.sql.bz2 | bzip2 -cd | docker-compose exec -T mysql /bin/bash -c 'cat | mysql -u root -p wordpress'

docker-compose exec -T mysql mysql -u root -p wordpress < wordpress-db.backup.sql

## Restore

**Banco**
```sh
bzip2 -kd wordpress-db.backup.sql.bz2 && \
docker-compose exec -T mysql mysql -u root -p"toor" wordpress < wordpress-db.backup.sql
```

**Wordpress**
```sh
bzip2 -kd wordpress-backup.tar.bz2 && \
chmod -R 767 wordpress
```

show databases; use wordpress; SHOW WARNINGS; UPDATE wp_options SET option_value = 'http://ip172-18-0-105-bvrk1c9lo55000eqhv1g-80.direct.labs.play-with-docker.com' WHERE wp_options.option_id = 1 OR wp_options.option_id = 2;

docker-compose exec -T mysql mysql -u"root" -p"toor" <<< "show databases; use wordpress; SHOW WARNINGS; UPDATE wp_options SET option_value = 'http://ip172-18-0-105-bvrk1c9lo55000eqhv1g-80.direct.labs.play-with-docker.com' WHERE wp_options.option_id = 1 OR wp_options.option_id = 2; SHOW WARNINGS;"

wordpress.wp_options

id:1 - siteurl http://ip172-18-0-105-bvrk1c9lo55000eqhv1g-80.direct.labs.play-with-docker.com
id:2 - home http://ip172-18-0-105-bvrk1c9lo55000eqhv1g-80.direct.labs.play-with-docker.com

----

docker-compose exec -T mysql mysql -u"root" -p"toor" <<< "show databases; use wordpress; SHOW WARNINGS; UPDATE wp_options SET option_value = 'http://ip.com' WHERE wp_options.option_id = 1 OR wp_options.option_id = 2; SHOW WARNINGS;"

docker-compose exec -T mysql mysql -u"root" -p"toor" <<< "UPDATE wordpress.wp_options SET option_value = 'http://ip.com' WHERE wp_options.option_id = 1 OR wp_options.option_id = 2;"