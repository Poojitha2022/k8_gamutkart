pipeline {
  agent any
  stages {
	stage("Checkout") {
      steps {
        sh 'git clone https://github.com/Poojitha2022/k8_gamutkart.git'
	    sh 'cd k8_gamutkart'
      }
	}
	stage("build ") {
      steps {     
        sh 'mvn clean install'
      }
    }
    stage("Build Image") {
      steps {          
        sh 'docker build -t poojitha2022/gamukart:latest .'
      }
    }
    stage("pushtoHub") { 
        steps{
           withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
             sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
             sh 'docker push poojitha2022/gamukart:latest'
           }
        }
     }
     stage("Deploying App to Kubernetes") {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "k8s")
        }
      }
    }
  }
}	
