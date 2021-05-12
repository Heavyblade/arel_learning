require_relative 'arel_learning'
require 'ostruct'

# xxxxxxxxxx Subqueries xxxxxxxxx
def subqueries_ar
  Actor.where(actor_id: FilmActor.select(:actor_id).where(film_id: 1))
end

def subqueries_arel
  actor_ids = film_actor_arel
              .project(film_actor_arel[:actor_id])
              .where(film_actor_arel[:film_id].eq(1))

  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:actor_id].in(actor_ids))
end

# xxxxxxxxxx UNION xxxxxxxxx
def union_ar
  OpenStruct.new(to_sql: "Pending")
  #Actor.where(first_name: 'Nick').arel.union(Actor.where(first_name: 'Nick').arel)
end

def union_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].eq('Nick'))
    .union(
      actor_arel
      .project(actor_arel[Arel.star])
      .where(actor_arel[:first_name].eq('Grace'))
    )
end

# xxxxxxxxxx CTEs xxxxxxxxx
def cte_ar
  OpenStruct.new(to_sql: "Pending")
end

def cte_arel
  film_actor_arel
    .project(film_actor_arel[:actor_id])
    .with(pg_films_cte)
    .join(pg_films)
    .on(pg_films[:film_id].eq(film_actor_arel[:film_id]))
end

def pg_films
  Arel::Table.new(:pg_films)
end

def pg_films_cte
  query = film_arel
          .project(film_arel[:film_id], film_arel[:title])
          .where(film_arel[:rating].eq('PG'))

  Arel::Nodes::As.new(pg_films, query)
end

execute