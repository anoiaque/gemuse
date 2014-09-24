require_relative '../gemuse'
require 'colorize'

namespace :gemuse do
  task :unused do
    Gemuse::Base.new.unused.each do |gem|
      puts "Running".green
      puts "#{gem.name} | #{gem.namespace} | #{gem.path}".yellow
    end
  end
end