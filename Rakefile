ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'


# Type `rake -T` on your command line to see the available rake tasks.

def reload!
  load_all "./config" if Dir.exists?("./config")
  load_all "./app" if Dir.exists?("./app")
  load_all "./*.rb" if Dir.entries(".").include?(/\.rb/)
end

# rake console
task :console do
  puts "Loading application in environment..."
  reload!
  puts "Console started"
  Pry.start
end

task :drop do
  system('rm db/development.sqlite && rm db/test.sqlite && rm db/schema.rb')
end

task :migrations do
  system('rake db:migrate && rake db:migrate SINATRA_ENV=test')
end
