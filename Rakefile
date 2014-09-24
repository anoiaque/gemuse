require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/gemuse'
  t.test_files = FileList['test/lib/gemuse/*_test.rb']
  t.verbose = true
end

task :default => :test

import File.join(File.dirname(__FILE__), 'lib/tasks/gemuse.rake')
