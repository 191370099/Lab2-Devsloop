class Task < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :due_date, presence: true
  belongs_to :project
  belongs_to :developer

  before_validation :due_date_must_valid

  private

  def due_date_must_valid
    return unless due_date.present? && due_date <= Date.current

    errors.add(:due_date, 'must be in the future')
  end
end
