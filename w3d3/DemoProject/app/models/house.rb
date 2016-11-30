class House < ActiveRecord::Base
  has_many(
  :people,
  :class_name => "Person",
  :foreign_key => :house_id,
  :primary_key => :id
)
  validates :address, :presence => true

end
