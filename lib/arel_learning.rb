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

def actor_arel
  Actor.arel_table
end

def film_actor_arel
  FilmActor.arel_table
end

def film_arel
  Film.arel_table
end

def execute
  puts send("#{ARGV[0]}_ar").to_sql
  puts send("#{ARGV[0]}_arel").to_sql
end