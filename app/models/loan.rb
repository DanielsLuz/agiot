class Loan < ApplicationRecord
  validates :value, presence: true
  validates :paytime, presence: true

  belongs_to :user
end
