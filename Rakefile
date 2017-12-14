require 'bundler/setup'

desc 'Run Chef style checks with foodcritic'
task :style do
  require 'foodcritic'
  FoodCritic::Rake::LintTask.new(:style)
end

desc 'Run ChefSpec unit tests'
task :unit do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.rspec_opts = '--color --format progress'
    t.pattern = 'spec/unit/**{,/*/**}/*_spec.rb'
  end
end

desc 'Integration Tests'
namespace :integration do
  desc 'Run integration tests with Test Kitchen'
  task :testkitchen do
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.yml')
    Kitchen::Config.new(loader: @loader).instances.each do |instance|
      instance.test(:always)
    end
  end
end
