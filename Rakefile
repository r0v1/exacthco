# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
# require 'parallel'
require 'rspec/core/rake_task'

Rails.application.load_tasks

RSpec::Core::RakeTask.new(:single) do |t|
  ENV['CONFIG_NAME'] ||= "single"
  t.pattern = Dir.glob('spec/transactions/qa_vanilla_pp_bs.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

task :default => :single

RSpec::Core::RakeTask.new(:local) do |t|
  ENV['CONFIG_NAME'] ||= "local"
  t.pattern = Dir.glob('spec/local_test.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

# task :parallel do |t, args|
  # @num_parallel = 4

  # Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    # ENV["TASK_ID"] = (task_id - 1).to_s
    # ENV['name'] = "parallel_test"
    # ENV['CONFIG_NAME'] = "parallel"

    # Rake::Task["single"].invoke
    # Rake::Task["single"].reenable
  # end
# end

task :test do |t, args|
  Rake::Task["single"].invoke
  Rake::Task["single"].reenable
  Rake::Task["local"].invoke
  Rake::Task["parallel"].invoke
end
