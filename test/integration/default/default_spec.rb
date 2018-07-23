#
# Cookbook Name:: vmware-pipeline-example
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# The following are only examples, check out https://github.com/chef/inspec/tree/master/docs
# for everything you can do.

describe port(80) do
  it { should_not be_listening }
end

if os[:family] == 'debian'
  describe file('/usr/bin/vim') do
    it { should exist }
    it { should be_symlink }
  end
elsif os[:family] == 'redhat'
  describe file('/usr/bin/vim') do
    it { should exist }
    it { should_not be_symlink }
  end
end

describe port(8080) do
  it { should_not be_listening }
end

describe port(80) do
  it { should_not be_listening }
end

describe yaml('.kitchen.yml') do
  its('driver.name') { should eq('vagrant') }
end
