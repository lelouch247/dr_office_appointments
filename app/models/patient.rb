class Patient < ApplicationRecord
  validates_presence_of :first_name, :last_name, :age, :race, :gender

  has_many :appointments, dependent: :destroy
  has_one :doctor, through: :appointments

  def full_name
    "#{first_name} #{last_name}"

  end
end
