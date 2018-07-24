pipeline {
    agent any
}
stages {
    stage('Bundle') {
        steps {
            sh 'bundle exec bundle install'
        }
    }
    stage('Chefspec') {
        steps {
            sh 'bundle exec rake spec'
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
}
triggers {
    pollSCM('H * * * *')
}
