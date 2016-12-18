module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)
    toy.toyable = self
    self.toys << toy
    self.save
    toy.save
  end
end
