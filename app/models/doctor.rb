class Doctor < ApplicationRecord
  validates_presence_of :first_name, :last_name, :gender

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
