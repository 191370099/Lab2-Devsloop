class Task < ApplicationRecord
  validates :name, presence: true, inclusion: { in: %w[bug feature], message: '%<value>s not valid!' }
  validates :due_date, presence: true
  belongs_to :project
  belongs_to :developer

  before_validation :due_date_must_valid
  before_save :check_category_of_developer, :check_availability

  private

  def due_date_must_valid
    return unless due_date.present? && due_date <= Date.current

    errors.add(:due_date, 'must be in the future')
  end

  def check_category_of_developer
    if developer.present?
      if name != developer.category
        errors.add(:name, 'must assign to relevent developer')
      end
    end
  end

  def check_availability
    if developer.present?
      if !developer.availability
        errors.add(:availability, 'Developer is not availabe!')
      else
        developer.availability = false
        developer.save
      end
    end
  end
end
