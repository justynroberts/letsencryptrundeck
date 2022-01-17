#!/bin/bash
#Letsencrypt to rundeck
# Usage (Takes a single parameter, the domain name) - Run as Root.

certbot certonly -d $1

openssl pkcs12 -export \
	 -in /etc/letsencrypt/live/$1/cert.pem \
	 -inkey /etc/letsencrypt/live/$1/privkey.pem \
	 -out /tmp/$1.p12 \
	 -name $1 \
	 -CAfile /etc/letsencrypt/live/$1/fullchain.pem \
	 -caname "Let's Encrypt Authority X3" \
	 -password pass:adminadmin

keytool -importkeystore \
	-deststorepass adminadmin \
	-destkeypass adminadmin \
	-deststoretype PKCS12 \
	-srckeystore /tmp/$1.p12 \
	-srcstoretype PKCS12 \
	-srcstorepass admin \
	-destkeystore keystore \
	-alias  $1
