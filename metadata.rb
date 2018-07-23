name 'vmware-pipeline-example'
maintainer 'JJ Asghar'
maintainer_email 'jj@chef.io'
license 'Apache-2.0'
description 'Installs/Configures vmware-pipeline-example'
long_description 'Installs/Configures vmware-pipeline-example'
version '0.1.0' # TODO: make sure your version is correct

chef_version '>= 12'

# TODO: any Dependacies?
# depends 'chefdk', '> 1.0.0'

# TODO: Platform support....
%w(ubuntu debian redhat centos suse opensuse).each do |os|
  supports os
end

issues_url 'https://github.com/jjasghar/vmware-pipeline-example/issues'
source_url 'https://github.com/jjasghar/vmware-pipeline-example'
