class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments

  validates :name, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :date_of_birth, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :owner, presence: true
  
  validate :date_of_birth_cannot_be_in_the_future

  private

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end