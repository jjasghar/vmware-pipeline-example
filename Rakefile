require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'
require 'chefspec'
require 'cookstyle'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby) do |task|
    task.options << '--display-cop-names'
  end

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any'],
      tags: [
        '~FC005',
        '~FC023',
      ],
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant (local)'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Run Test Kitchen with Docker (remote)'
  task :docker do
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.docker.yml')
    config = Kitchen::Config.new(loader: @loader)
    config.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Run Test Kitchen with Dokken (local)'
  task :dokken do
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.dokken.yml')
    config = Kitchen::Config.new(loader: @loader)
    config.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Run Test Kitchen with vCenter (remote)'
  task :vcenter do
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.vcenter.yml')
    config = Kitchen::Config.new(loader: @loader)
    config.instances.each do |instance|
      instance.test(:always)
    end
  end
end

desc 'Run all integration tests'
task integration: [ 'integration:dokken', 'integration:vagrant', 'integration:docker', 'integration:vcenter']

task default: ['style', 'spec', 'integration:dokken', 'integration:vagrant', 'integration:docker']
