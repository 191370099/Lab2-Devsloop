class Developer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, length: { minimum: 6, maximum: 20 }
  validates :category, presence: true, inclusion: { in: %w[bug feature], message: '%<value>s not valid!' }
  has_many :tasks
end
