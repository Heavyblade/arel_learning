require_relative 'arel_learning'

# xxxxxxxxxx Hello World xxxxxxxxx
def hello_world_ar
  Actor.all.to_sql
end

def hello_world_arel
  Actor.arel_table.project(Arel.star).to_sql
end

# xxxxxxx Selecting Fields xxxxxxx
def selecting_fields_ar
  Actor.select(:first_name)
end

def selecting_fields_arel
  actor_arel.project(actor_arel[:first_name])
end

# xxxxxxx Simple Condition xxxxxxx
def simple_condition_ar
  Actor.where(first_name: 'Nick')
end

def simple_condition_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].eq('Nick'))
end

# xxxxxxx Comples Condition 'and' xxxxxxx
def complex_condition_and_ar
  Actor.where(first_name: 'Nick', last_name: 'Wahlberg')
end

def complex_condition_and_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].eq('Nick')
          .and(actor_arel[:last_name].eq('Wahlberg')))
end

# xxxxxxx Comples Condition 'or' xxxxxxx
def complex_condition_or_ar
  Actor.where(first_name: 'Nick').or(Actor.where(last_name: 'Wahlberg'))
end

def complex_condition_or_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].eq('Nick')
          .or(actor_arel[:last_name].eq('Wahlberg')))
end

# xxxxxxx Comples Condition '> or <' xxxxxxx
def complex_condition_gt_ar
  Actor.where('id > ?', 10)
end

def complex_condition_gt_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:id].gt(10))
end

# xxxxxxx Complex Condition '<>' xxxxxxx
def complex_condition_nor_ar
  Actor.where.not(first_name: 'Nick')
end

def complex_condition_nor_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].not_eq('Nick'))
end

# xxxxxxx Complex Condition 'array' xxxxxxx
def complex_condition_array_ar
  Actor.where(first_name: ['Nick', 'Joe', 'karl'])
end

def complex_condition_array_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .where(actor_arel[:first_name].in(['Nick', 'Joe', 'karl']))
end

# xxxxxxxxxxxx Ordering xxxxxxxxxxx
def ordering_ar
  Actor.all.order(first_name: :asc)
end

def ordering_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .order(actor_arel[:first_name].asc)
end

# xxxxxxxxxxxxx Limit xxxxxxxxxxxxx
def limiting_ar
  Actor.all.limit(5).offset(1)
end

def limiting_arel
  actor_arel
    .project(actor_arel[Arel.star])
    .take(5)
    .skip(1)
end

execute