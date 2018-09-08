node ('node1'){
  stage('Checkout code'){
    git 'https://github.com/egormin/test_pipeline'
  }
   stage('Deploy instance'){
    sh "terraform apply -auto-approve"
  }
   stage('deploy'){
    echo "OK"
  }
   stage('check'){
    echo "OK"
  }
}
