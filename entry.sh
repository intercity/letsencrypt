#!/bin/sh
set -e

darkhttpd /root/letsencrypt/www/ --port 80 --daemon

# Ensure we run latest version of acme.sh
curl https://get.acme.sh | sh
# ls /root/.acme.sh
/root/.acme.sh/acme.sh  --issue  -d jeroen.intercity.io -w /root/letsencrypt/www --staging \
 --debug --standalone --accountkey /root/letsencrypt/account.key \
 --certhome /root/letsencrypt/certs/

rm -rf /root/letsencrypt/www

