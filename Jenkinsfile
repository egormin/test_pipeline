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
   ansiblePlaybook inventory: 'ansible/inventory', playbook: 'ansible/playbook.yml'
  }
  stage('Destroy instance'){
    //sh "terraform destroy -auto-approve"
    echo "OK"
  }
}
