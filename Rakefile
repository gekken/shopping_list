require 'rspec/core/rake_task'

task :default => :install
task :install
task :spec

#namespace :spec do
  desc "Run rspec on all the spec files"
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "./spec/**/*_spec.rb"
  end
#end

namespace :install do
  directory File.expand_path "~/Dropbox/ShoppingList"
end
