class Person < ApplicationRecord
    
  scope :get_ordered, -> { order("created_at DESC") }
end
