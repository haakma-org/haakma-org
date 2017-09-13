FROM jenkinsci/blueocean:latest

USER root

RUN apk add gpgme

USER jenkins

COPY nexus/sonatype/settings.xml /var/jenkins_home/.m2/settings.xml
COPY nexus/sonatype/haakma.asc /var/jenkins_home/.m2/haakma.asc
