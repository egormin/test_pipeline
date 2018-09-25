node ('node1'){
   timestamps {
  stage('Checkout code'){
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
    sh "terraform init"
    sh "terraform apply -auto-approve"
    sleep 20
  }  
   stage('Ansible applying'){
    sh "ssh-keygen -f ~/.ssh/known_hosts -R 52.15.177.245"
    ansiblePlaybook inventory: 'ansible/inventory', playbook: 'ansible/playbook.yml'
  }
  stage('Inspec tests centos6'){
    sh "ssh-keygen -f ~/.ssh/known_hosts -R 52.15.177.245"
    sh "inspec exec inspec/controls/section_01.rb -t ssh://centos@52.15.177.245 --reporter junit:reports6/junit.xml -i /home/build/.ssh/id_rsa || exit 0"
  }
    stage('Inspec tests centos7'){
    sh "ssh-keygen -f ~/.ssh/known_hosts -R 52.15.177.245"
    sh "inspec exec inspec/controls/section_01.rb -t ssh://centos@52.15.177.245 --reporter junit:reports7/junit.xml -i ~/.ssh/id_rsa || exit 0"
  }
  stage('Destroy instance'){   
    sh "terraform destroy -auto-approve"
    //echo "OK"
  }
    stage('Allure report6'){   
    allure includeProperties: false, jdk: '', results: [[path: 'reports6/'], [path: 'reports7/']]
  }
    //stage('Allure report7'){   
    //allure includeProperties: false, jdk: '', results: [[path: 'reports/']] 
  //}
  //     stage('Junit report'){   
  //  junit 'reports/junit.xml'
    //echo "OK"
 // }  
  }
}
