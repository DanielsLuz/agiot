class User < ApplicationRecord
  validates :name, presence: true
  has_many :loans

  def unpaid_loans?
    !loans.where("paid = ?", false).empty?
  end

  def ordered_loans
    loans.sort_by(&:created_at).reverse!
  end
end
