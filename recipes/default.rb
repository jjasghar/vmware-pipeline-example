#
# Cookbook Name:: vmware-pipeline-example
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
  package 'vim'
when 'rhel'
  package 'vim-enhanced'
end
