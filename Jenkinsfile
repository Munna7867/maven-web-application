  pipeline {
     agent any
	 stages{
	     stage ('git checkout')
		 {
		     steps
			 {git branch: 'main', url: 'https://github.com/Munna7867/maven-web-application.git'
			 }
         }
		 stage ('Unit test')
		 {
		    steps{
			  sh 'mvn test'  
			 }
         }
		  stage ('integration testing')
		 {
		    steps{
			  sh 'mvn verify -DskipUnitTests'  
			 }
         }
	     stage ('maven building')
		 {
		    steps{
			  sh 'mvn clean install'  
			 }
         }
	     stage ('static code analysis')
		 {
		    steps{
			   script{
			  withSonarQubeEnv(credentialsId: 'sonar-api') 
			  {
              sh'mvn clean package sonar:sonar'    
                  } 
				 }
			 }
         }
	      stage ('quality gate status')
		 {
		    steps{
			   script{
			  waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
			 
				 }
			 }
         } 
	      stage ('upload war file to nexus')
		 {
		    steps{
			   script{
			  nexusArtifactUploader artifacts: 
			  [
			     [
			        artifactId: 'maven-web-application', 
			        classifier: '', file: 'target/maven-web-application.war', 
			        type: 'war'
			        ]
			  ], 
			  credentialsId: 'nexus-arth', 
			  groupId: 'com.mt', 
			  nexusUrl: '43.204.231.156:8081', 
			  nexusVersion: 'nexus3', 
			  protocol: 'http', 
			  repository: 'demoproject-release', 
			  version: '0.0.2'
			 
				 }
			 }
         }  
	      stage ('Docker Image Build')
		 {
		    steps{
			   script{
			        sh'docker image build -t demoproject:v1.29 .'
					sh'docker image tag demoproject:v1.29 baluyadav039/demoproject:v1.29'
					sh'docker image tag demoproject:v1.29 baluyadav039/demoproject:latest'		
	       	     }
			 }
         }
	  }	  
	     
	 }
