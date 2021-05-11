class FilmActor < ActiveRecord::Base
  belongs_to :actor, class_name: "Actor", primary_key: "actor_id"
  belongs_to :film, class_name: "Film", primary_key: "film_id"

  self.table_name = 'film_actor'
end