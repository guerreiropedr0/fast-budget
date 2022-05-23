class User < ApplicationRecord
  has_many :groups
  has_many :operations

  validates :name, presence: true, length: { in: 1..100 }
end
