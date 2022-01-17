
# Lets Encrypt Rundeck certs

Utilise Lets Encrypt signed certs in Rundeck


Usage:
RUN THE SCRIPT FROM THE SSL DIRECTORY. eg /etc/rundeck/ssl

    sudo create.sh mydomain.com

Will take you through the lets encrypt cert signing process, then export the certs to the java keystore.

Assumptions
Letsencrypt is installed


**After.**

Ensure new URLS are entered in rundeck-configuration.properties and framework.properties

Ensure following variables are set 

    RUNDECK_WITH_SSL=true
    RDECK_HTTPS_PORT=1234

Restart and you are good to go.
