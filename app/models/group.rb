class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :operations

  validates :name, presence: true, length: { in: 1..100 }
  validates :icon, presence: true, length: { in: 1..300 }
end
