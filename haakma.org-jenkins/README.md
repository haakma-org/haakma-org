# Jenkins

We run Jenkins at haakma.org for backup reasons and the development of different software packages.

## Configure host system

* Install docker (see haakma.org-docker repo documentation)
  * [haakma.org-docker]()

* You have to add the **jenkins** user to the host system with uuid **1000**
  * ` useradd -u 1000 jenkins`

* To make sure the proxypasses are working in apache2 on the host system execute the following commands:
  * `sudo a2enmod ssl`
  * `sudo a2enmod proxy`
  * `sudo a2enmod proxy_balancer`
  * `sudo a2enmod proxy_http`

## Run Jenkins

If you want to run Jenkins in Docker please execute the following command:

`docker-compose up -d`

# Jobs

The job that are located at the Jenkins are divided into 2 main items:

* Backup jobs
* Software jobs
  * Opensource community
  * Granny-Connect

## Backup

* haakma.org-site
* haakma.org-webmail

* grotevriendelijkedames.nl-site

* bronsenproject.nl-site
* bronsenproject.nl-webmail
* bronsenproject.nl-finance

## Opensource community

* semver-maven-plugin

## Granny-Connect

* granny-connect.com-site
* granny-connect.com-backen
* granny-connect.com-frontend

# Troubleshooting

If you can't write into the jenkins_home directory please check your permissions.
The following command works in 90% of the cases.

`sudo chown -R 1000 /home/jenkins/jenkins_home`



