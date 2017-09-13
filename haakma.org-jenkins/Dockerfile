FROM jenkinsci/blueocean:latest

USER root

# Install gnupg-key package
RUN apk add gpgme

# Setup backup directories
RUN mkdir /home/backup
RUN chown jenkins:jenkins /home/backup

# Setup site mapping
RUN mkdir /home/sites/
RUN chown jenkins:jenkins /home/sites

# Setup postfix and dovecot configuration and mail directories
RUN mkdir /home/mail
RUN mkdir -p /home/config/
RUN mkdir -p /home/config/postfix
RUN mkdir -p /home/config/dovecot
RUN chown -R jenkins:jenkins /home/mail
RUN chown -R jenkins:jenkins /home/config

# Return to user jenkins (was root)
USER jenkins

# Setup sonatype keys
RUN mkdir /var/jenkins_home/.gnupg
COPY sonatype/* /var/jenkins_home/.m2/
COPY gnupg/* /var/jenkins_home/.gnupg/
