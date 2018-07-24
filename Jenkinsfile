pipeline {
    agent any
    stages {
        stage('Prep Workspace'){
            steps {
                cleanWs()
                git 'https://github.com/jjasghar/vmware-pipeline-example.git'
                sh 'bash -c " source ~/.rvm/scripts/rvm && rvm use --install --create 2.5.0@vmwarepipeline && export > rvm.env"'
            }
        }
        stage('Bundle') {
            steps {
                sh 'bundle install'
                sh '''git clone https://github.com/vmware/vsphere-automation-sdk-ruby.git
cd vsphere-automation-sdk-ruby
gem build vsphere-automation-sdk-ruby.gemspec
gem install vsphere-automation-sdk-*.gem
cd ..
bundle install --full-index'''
            }
        }
        stage('Chefspec') {
            steps {
                sh 'rm -rf vsphere-automation-sdk-ruby'
                sh 'bundle exec rake style'
            }
        }
        stage('Docker Sanity Check') {
            steps {
                sh 'bundle exec rake integration:docker'
            }
        }
        stage('vCenter Verification') {
            steps {
                sh 'bundle exec rake integration:vcenter'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'bash -l -c "rvm --force gemset delete vmwarepipeline"'
            }
        }

    }
}
