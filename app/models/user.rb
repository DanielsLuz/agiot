class User < ApplicationRecord
  validates :name, presence: true
  has_many :loans

  def has_unpaid_loans
    !loans.where("paid = ?", false).empty?
  end
end
