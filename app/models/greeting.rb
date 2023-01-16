class Greeting < ApplicationRecord
  belongs_to :user

  validates :msg, presence: true
end
