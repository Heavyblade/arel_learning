require_relative 'arel_learning'

# xxxxxxxxxx Join - Simple xxxxxxxxx
def simple_join_ar
  Actor.joins(:film_actor)
end

def simple_join_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .join(film_actor_arel)
    .on(film_actor_arel[:actor_id].eq(actor_arel[:actor_id]))
end

# xxxxxxxxxx Join - Simple with condition xxxxxxxxx
def join_with_condition_ar
  Actor.joins('inner join film_actor on film_actor.actor_id = actor.actor_id and actor.actor_id > 10')
end

def join_with_condition_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .join(film_actor_arel)
    .on(film_actor_arel[:actor_id].eq(actor_arel[:actor_id])
        .and(actor_arel[:actor_id].gt(10)))
end

# xxxxxxxxxx Join - conditions on joined table xxxxxxxxx
def movie_actors_ar
  Actor.joins(:film_actors).where(film_actor: { film_id: 1 })
end

def movie_actors_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .join(film_actor_arel)
    .on(film_actor_arel[:actor_id].eq(actor_arel[:actor_id]))
    .where(film_actor_arel[:film_id].eq(1))
end

# xxxxxxxxxx left Join xxxxxxxxx
def left_join_ar
  Actor.left_outer_joins(:film_actors).where(film_actor: { film_id: nil })
end

def left_join_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .outer_join(film_actor_arel)
    .on(film_actor_arel[:actor_id].eq(actor_arel[:actor_id]))
    .where(film_actor_arel[:film_id].eq(nil))
end

# xxxxxxxxxx Nested Joins xxxxxxxxx
def nested_join_ar
  Actor.joins(film_actors: :film).where(film: { title: 'Academy Dinosaur' })
  #Actor.joins(:films).where(film: { title: 'Academy Dinosaur' })
end

def nested_join_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .join(film_actor_arel).on(film_actor_arel[:actor_id].eq(actor_arel[:actor_id]))
    .join(film_arel).on(film_arel[:film_id].eq(film_actor_arel[:film_id]))
    .where(film_arel[:title].eq('Academy Dinosaur'))
end

execute
