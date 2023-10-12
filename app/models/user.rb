class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, length: { minimum: 6, maximum: 20 }
  has_many :projects
end
