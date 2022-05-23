class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { in: 1..100 }
  validates :amount, numericality: { greater_than_or_equal_to: 1 }
end
