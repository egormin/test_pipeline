node ('node1'){
  stage('Checkout code'){
    git 'https://github.com/egormin/test_pipeline'
  }
   stage('Deploy instance'){
    //sh "terraform apply -auto-approve"
  }
   stage('deploy'){
    echo "OK"
  }
   stage('Ansible'){
   sh "ansible --version"
  }
  stage('Destroy instance'){
    //sh "terraform destroy -auto-approve"
    echo "OK"
  }
}
