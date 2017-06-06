class Doctor < ApplicationRecord
  validates_presence_of :name, :age, :gender

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
