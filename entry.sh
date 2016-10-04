#!/bin/sh
set -e

DOMAIN=${DOMAIN:-}

if [ "${DOMAIN}" ]
then
  echo "Doing stuff ${DOMAIN}"
  darkhttpd /root/letsencrypt/www/ --port 80 --daemon

  # Ensure we run latest version of acme.sh
  curl https://get.acme.sh | sh
  # ls /root/.acme.sh
  /root/.acme.sh/acme.sh  --issue  -d $DOMAIN -w /root/letsencrypt/www --staging \
   --debug --standalone --accountkey /root/letsencrypt/account.key \
   --certhome /root/letsencrypt/certs/

  rm -rf /root/letsencrypt/www
else
  echo "Domain is required"
fi

