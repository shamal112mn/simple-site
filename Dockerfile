node{
    properties([
        parameters([
            string(defaultValue: '', description: 'Provide Remote Node IP', name: 'node_ip', trim: true)
        ])
    ])

    stage("Git Clone"){
        git url: 'https://github.com/shamal112mn/simple-site.git'
    }

    /* groovylint-disable-next-line LineLength */
    withCredentials([sshUserPrivateKey(credentialsId: 'master_ssh_keys', keyFileVariable: 'SSH_KEY', passphraseVariable: '', usernameVariable: 'SSH_USERNAME')]) 
    {
         
        
        stage('Install Nginx'){
            sh 'ssh -o StrictHostKeyChecking=false -i $SSH_KEY $SSH_USERNAME@${node_ip} sudo apt-get update'
            sh 'ssh -o StrictHostKeyChecking=false -i $SSH_KEY $SSH_USERNAME@${node_ip} sudo apt-get install nginx -y'
        }
       
       stage('Move Files'){
            sh '''
            scp -r -i $SSH_KEY * $SSH_USERNAME@${node_ip}:/tmp
            ssh -o StrictHostKeyChecking=false -i $SSH_KEY $SSH_USERNAME@${node_ip} sudo cp /tmp/index.html /var/www/html/  
            ssh -o StrictHostKeyChecking=false -i $SSH_KEY $SSH_USERNAME@${node_ip} sudo chown -R 1000 /var/www/html
            
            '''
        }
        
        
        stage('Start Nginx'){
            /* groovylint-disable-next-line LineLength */
            sh 'ssh -o StrictHostKeyChecking=false -i $SSH_KEY $SSH_USERNAME@${node_ip} "sudo systemctl start nginx"'
        }
    } 
}

