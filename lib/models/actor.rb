class Actor < ActiveRecord::Base
  self.table_name = 'actor'
  self.primary_key = 'actor_id'

  has_many :film_actors, class_name: 'FilmActor', foreign_key: 'actor_id'
  has_many :films, through: :film_actors
end