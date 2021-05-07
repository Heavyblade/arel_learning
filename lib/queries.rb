require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'active_model'
require 'active_support'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob("#{project_root}/models/*.rb").sort.each { |f| require f }

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'postgres',
  password: 'postgres',
  database: 'chinook'
)

puts Actor.first
