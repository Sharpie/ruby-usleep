require 'rake/extensiontask'
require 'rspec/core/rake_task'

Rake::ExtensionTask.new 'ext' do |ext|
  ext.lib_dir = 'lib/usleep'
end

namespace(:spec) do
  desc 'Run RSpec unit tests'
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern = 'spec/unit/**{,/*/**}/*_spec.rb'
  end
end

desc 'Run all test suites'
task(:test => ['spec:unit'])
