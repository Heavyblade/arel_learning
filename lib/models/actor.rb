class Actor < ActiveRecord::Base
  self.table_name = 'actor'
  self.primary_key = 'actor_id'
end