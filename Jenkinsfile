node ('node1'){
  stage('Checkout code'){
    git 'https://github.com/egormin/test_pipeline'
  }
  stage('Ansible lint checking'){
    sh "ansible-lint ansible/*.yml;ansible-lint ansible/roles"
  }  
   stage('Deploy instance'){
    sh "terraform apply -auto-approve"
    sleep 20
  }
   stage('Check report generation'){
    echo "OK"
  }
   stage('Ansible'){
   sh "ssh-keygen -f ~/.ssh/known_hosts -R 52.15.177.245"
   ansiblePlaybook inventory: 'ansible/inventory', playbook: 'ansible/playbook.yml'
  }
  stage('Destroy instance'){
    always {
    sh "terraform destroy -auto-approve"
    //echo "OK"
    }
  }
  post {
    always {
      sh "terraform destroy -auto-approve"
    }
  }
}
