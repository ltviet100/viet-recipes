class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :chef
  delegate :chefname, to: :chef, allow_nil: true
  validates :chef_id, presence: true
end
