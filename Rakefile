require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask .new(:spec) do |task|
  task.rspec_opts = ["--format documentation"]
end
