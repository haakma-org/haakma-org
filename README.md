# haakma.org

This domain has of a number of subdomains:

* admin.haakma.org
* www.haakma.org
* webmail.haakma.org
* verbouw.haakma.org
* jenkins.haakma.org
* docker.haakma.org

# Configuration

There are several services available on haakma.org.

* Apache2 - you can locate the apache configuration in:
  * haakma.org-site/apache2
    * admin-haakma-org.conf
    * wwww-haakma-org.conf
  * haakma.org-webmail/apache2
    * webmail-haakma-org.conf
  * haakma.org-webmail/apache2
    * verbouw-haakma-org.conf
  * haakma.org-jenkins/apache2
    * jenkins-haakma-org.conf
  * haakma.org-docker/apache2
    * docker-haakma-org.conf
* Dovecot
  * This is in the daily backup cycle
* Postfix
  * This is in the daily backup cycle
* MySQL
  * Configuration is found in haakma.org-mysql. IN the docker-compose file the MySQL-server is setup. 

## Backup

Each day around 9:00 PM the backup is executed on [jenkins.haakma.org](http://jenkins.haakma.org/job/haakma-org/job/haakma-org/).

## Slack

You can signup to the slack account [haakma.slack.com](https://haakma.slack.com) and receive notification messages of backups and other administrative processes.
