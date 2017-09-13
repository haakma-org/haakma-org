node {
  def gitRemoteUser = 'jenkins'
  def gitRemoteUrl = 'github.com/haakma-org/haakma-org'
  stage('Preparation') {
    // Clean workspace
    step([$class: 'WsCleanup', cleanWhenFailure: false])
    // Get code from github.com
    checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-git', url: 'http://' + gitRemoteUser + '@' + gitRemoteUrl + '.git']]]
  }
  stage('Backup haakma.org') {
    echo "Backup haakma.org"
    sh "./haakma.org-site/backup/backup_haakma-site.sh"
  }
  stage('Backup verbouw.haakma.org') {
    echo "Backup verbouw.haakma.org"
    sh "./haakma.org-verbouw/backup/backup_haakma-verbouw.sh"
  }
  stage('Backup webmail.haakma.org') {
    echo "Backup webmail.haakma.org"
    sh "./haakma.org-webmail/backup/backup_haakma-webmail.sh"
  }
  stage('Cleanup old backups') {
      echo "Cleanup old backups"
      sh "./utils/move_old_backups.sh"
    }
  stage('Notify') {
    emailext body: '''Hi everybody,
      <br>
      <br>
      All backups are successfully performed
      <br>
      <br>
      <ul>
      <li>haakma.org</li>
      <li>verbouw.haakma.org</li>
      <li>webmail.haakma.org</li>
      </ul> 
      <br>
      <br>
      Kind regards,
      <br>
      <br>
      Build-team''', subject: 'New version of ${JOB_NAME} - ' + pom.version, to: 'sido@haakma.org'
    currentBuild.result = 'SUCCESS';
  }
}
