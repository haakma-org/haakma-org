pipeline {
  triggers {
    cron('H 4/* 0 0 1-5')
  }
  agent any
  stages {
    stage('Preparation') {
      steps {
        def gitRemoteUser = 'jenkins'
        def gitRemoteUrl = 'github.com/haakma-org/haakma-org'
        // Clean workspace
        step([$class: 'WsCleanup', cleanWhenFailure: false])
        // Get code from github.com
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-git', url: 'http://' + gitRemoteUser + '@' + gitRemoteUrl + '.git']]]
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
    stage('Notify') {
      steps {
        slackSend channel: '#backup', color: 'good', message: 'Backup haakma.org successfull', teamDomain: 'https://haakma.slack.com/'
        currentBuild.result = 'SUCCESS';
      }
    }
  }
}
