pipeline {
  agent any
  triggers {
    cron '@daily'
  }
  stages {
    stage('Preparation') {
      steps {
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
    stage('Cleanup old backups') {
      steps {
        echo "Cleanup old backups"
        sh "./utils/move_old_backups.sh"
      }
    }
  }
  post {
    success {
      slackSend channel: '#backup',
                color: 'good',
                message: "The backup <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER} completed successfully."
    }
    failure {
      slackSend channel: '#backup',
                color: 'red',
                message: "The backup <${env.BUILD_URL}|${env.JOB_NAME}> | #${env.BUILD_NUMBER} has failed."
    }
  }
}
