class Person < ActiveRecord::Base
  belongs_to(
  :house,
  :class_name => "House",
  :foreign_key => :house_id,
  :primary_key => :id
)
  validates :name, :presence => true
  validates :house_id, :presence => true

end
