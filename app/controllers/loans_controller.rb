class LoansController < ApplicationController
  def index
    @loan = Loan.new
  end
end
