node ('node1'){
   timestamps {
  stage(){
    git 'https://github.com/egormin/test_pipeline'
  }
  stage('Ansible syntax checking'){   
       ansiblePlaybook inventory: 'ansible/inventory', playbook: 'ansible/playbook.yml', extras: '--syntax-check'
  } 
  stage('Ansible style checking'){   
      sh "ansible-lint ansible/*.yml || exit 0";     
      sh "ansible-lint ansible/roles/ || exit 0"
  }   
   stage('Check report generation'){
    echo "OK"
  }
   stage('Deploy ec2 instance'){
    sh "terraform apply -auto-approve"
    sleep 20
  }  
   stage('Ansible applying'){
    sh "ssh-keygen -f ~/.ssh/known_hosts -R 52.15.177.245"
    ansiblePlaybook inventory: 'ansible/inventory', playbook: 'ansible/playbook.yml'
  }
  stage('Destroy instance'){   
    sh "terraform destroy -auto-approve"
    //echo "OK"
  }
  }
}
