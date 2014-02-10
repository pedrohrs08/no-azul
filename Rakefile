# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'jslint'
require 'jslint/tasks'
NoAzul::Application.load_tasks

task :build => ['db:drop','db:create', 'db:migrate', 'db:test:prepare', 'db:seed','jslint','jasmine:ci','spec', 'db:drop'] do |t|
	puts "Build Successfull"	
end