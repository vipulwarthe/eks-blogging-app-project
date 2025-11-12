pipeline {
    agent any

    tools {
        jdk "jdk"
        maven "maven"
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vipulwarthe/eks-blogging-app-project.git'
            }
        }

        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }

        stage('Trivy Filesystem Scan') {
            steps {
                sh "trivy fs . --format table -o trivy-fs-report.html"
            }
        }

        stage('SonarQube Code Analysis') {
            steps {
                withSonarQubeEnv('sonarqubeServer') {
                    sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
                        -Dsonar.projectKey=eks-blogging-app \
                        -Dsonar.projectName='EKS Blogging App' \
                        -Dsonar.java.binaries=target
                    '''
                }
            }
        }

        stage('Build Artifact') {
            steps {
                sh "mvn package -DskipTests"
            }
        }

        stage('Publish Maven Artifacts to Nexus') {
            steps {
                withMaven(globalMavenSettingsConfig: 'maven-settings', jdk: 'jdk', maven: 'maven', traceability: true) {
                    sh "mvn deploy"
                }
            }
        }

        stage('Docker Build & Tag') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub-cred', url: 'https://index.docker.io/v1/') {
                        sh "docker build -t vipulwarthe/blog-app-repo:latest ."
                    }
                }
            }
        }

        stage('Trivy Image Scan') {
            steps {
                sh "trivy image --format table -o trivy-image-report.html vipulwarthe/blog-app-repo:latest"
            }
        }

        stage('Docker Push Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub-cred', url: 'https://index.docker.io/v1/') {
                        sh "docker push vipulwarthe/blog-app-repo:latest"
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up workspace..."
            cleanWs()
        }
    }
}


