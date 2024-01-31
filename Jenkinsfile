pipeline {
    agent any
    tools{
        jdk 'jdk11'
        maven 'maven3'
    }
    
    environment{
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, credentialsId: '9f6d6649-facc-4222-acd4-7fadeb51ce05', poll: false, url: 'https://github.com/kcheth/Shopping-cart.git'
            }
        }
        
        stage('COMPILE') {
            steps {
                sh "mvn clean compile -DskipTests=True"
            }
        }
        
        stage('OWASP SCAN') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ ', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        stage('Sonarqube') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}
