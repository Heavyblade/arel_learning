class Film < ActiveRecord::Base
  self.table_name = 'film'
  self.primary_key = 'film_id'

  has_many :film_actors, class_name: 'FilmActor', foreign_key: 'film_id'
  has_many :actors, through: :film_actors
end