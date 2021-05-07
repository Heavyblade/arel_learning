require 'rubygems'
require 'bundler/setup'
require 'active_support/core_ext/enumerable'
require 'arel'

Bundler.require(:default)
require_relative 'fake_record'

Arel::Table.engine = FakeRecord::Base.new
table = Arel::Table.new :users

query = table.project(table[:name]).where(table[:name].eq('hola'))

def print_graph_diagram(query)
  graph = GraphViz.parse_string(query.to_dot)
  graph.output(png: 'query.png')
end

print_graph_diagram(query)
