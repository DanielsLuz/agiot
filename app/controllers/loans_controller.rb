class LoansController < ApplicationController
  def index
    @loan = Loan.new
  end

  def create
    @loan = Loan.new params.require(:loan).permit(:value)
    @loan.save
    redirect_to '/'
  end
end
