class Patient < ApplicationRecord
  validates_presence_of :name, :age, :race, :gender, :insurance

  has_many :appointments, dependent: :destroy
  has_one :doctor, through: :appointments
end
