class Loan < ApplicationRecord
  validates :value, presence: true
  validates :paytime, presence: true

  belongs_to :user

  def pay
    self.paid = true
    save
  end

  def to(user)
    self.user_id = user.id unless user.has_unpaid_loans
  end
end
