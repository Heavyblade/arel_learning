require "rubygems"
require 'bundler/setup'
require "active_support/core_ext/enumerable"

Bundler.require(:default)
require_relative "fake_record"

Arel::Table.engine = FakeRecord::Base.new

table = Arel::Table.new :users

table = table.project(Arel.star)
byebug
puts table.to_sql