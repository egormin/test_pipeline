node ('node1'){
  stage('Checkout code'){
    git 'https://github.com/egormin/test_pipeline'
  }
   stage('Init Terraform'){
   sh "terraform init"
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
