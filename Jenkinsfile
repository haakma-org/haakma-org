pipeline {
  agent any
  triggers {
    cron '@daily'
  }
  stages {
    stage('Preparation') {
      steps {
        // Backup has started
        notifyStarted()
        // Clean workspace
        step([$class: 'WsCleanup', cleanWhenFailure: false])
        // Get code from github.com
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-git', url: 'http://jenkins@github.com/haakma-org/haakma-org.git']]]
      }
    }
    stage('Backup haakma.org') {
      steps {
        echo "Backup haakma.org"
        sh "./haakma.org-site/backup/backup_haakma-site.sh"
      }
    }
    stage('Backup verbouw.haakma.org') {
      steps {
        echo "Backup verbouw.haakma.org"
        sh "./haakma.org-verbouw/backup/backup_haakma-verbouw.sh"
      }
    }
    stage('Backup webmail.haakma.org') {
      steps {
        echo "Backup webmail.haakma.org"
        sh "./haakma.org-webmail/backup/backup_haakma-webmail.sh"
      }
    }
    stage('Backup ftp.haakma.org') {
      steps {
        echo "Backup ftp.haakma.org"
        sh "./haakma.org-ftp/backup/backup_haakma-ftp.sh"
      }
    }
    stage('Cleanup old backups') {
      steps {
        echo "Archive old backups"
        sh "./utils/move_old_backups.sh"
        echo "Remove archived backups"
        sh "./utils/remove_archived_backups.sh"
      }
    }
  }
  post {
    success {
      notifySuccess()
    }
    failure {
      notifyFailed()
    }
  }
}

def notifyStarted() {
  slackSend (channel: '#haakma-org', color: '#FFFF00', message: "STARTED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifySuccess() {
  slackSend (channel: '#haakma-org', color: '#00FF00', message: "SUCCESSFUL: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
def notifyFailed() {
  slackSend (channel: '#haakma-org', color: '#FF0000', message: "FAILED: Job - <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER}")
}
