class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_many :treatments

  validates :date, presence: true
  validates :reason, presence: true
  validates :pet, presence: true
  validates :vet, presence: true
  validates :status, presence: true
end