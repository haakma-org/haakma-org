# webmail.haakma.org

We use PostFix, DoveCot and RoundCube to serve our mail services.

* [PostFix](http://www.postfix.org)
* [DoveCot](https://www.dovecot.org)
* [RoundCube](https://www.roundcube.net)

## Apache2

We use Apache2 as a webserver. The configuration for webmail is located in **apache2/webmail-haakma-org.conf**. This file has to be placed in 
* Debian - /etc/apache2/sites-available/
* CentOS like systems - /etc/httpd/conf.d/

## Backup

We now backup a view item:

* The SQL-database
* The maildirs on the server
* The webmail interface (RoundCube)
* The PostFix-configuration
* The DoveCot-configuration

We doe this through a Jenkins job which runs every night and executes a bash script: **backup/backup_haakma-webmail.sh**.