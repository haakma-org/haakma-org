FROM jenkinsci/blueocean:latest

USER root

RUN apk add gpgme

RUN mkdir /home/backup
RUN chown jenkins:jenkins /home/backup

USER jenkins

COPY sonatype/* /var/jenkins_home/.m2/
RUN mkdir /var/jenkins_home/.gnupg
COPY gnupg/* /var/jenkins_home/.gnupg/
