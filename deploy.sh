#!/bin/sh

WP2STATIC_PROCESSED_SITE="wordpress/uploads/wp2static-processed-site"
DEPLOY_DIR="docs"

if [ -d "$WP2STATIC_PROCESSED_SITE" ]; then
    echo "ok! ${WP2STATIC_PROCESSED_SITE} existe."
else
  echo "Error: ${WP2STATIC_PROCESSED_SITE} não existe. Processo encerrado."
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

echo "Fazendo deploy de ${WP2STATIC_PROCESSED_SITE}..."

rm -rf docs
cp -rp wordpress/uploads/wp2static-processed-site docs

echo "OK!"