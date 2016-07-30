class LoansController < ApplicationController
  before_action :mocks_user, only: [:create]

  def index
    @loan = Loan.new
  end

  def create
    @loan = Loan.new loan_params
    @current_user.loan = @loan
    @loan.save

    debugger
    redirect_to '/'
  end

  private

  def mocks_user
    @current_user = User.first
  end

  def loan_params
    params.require(:loan).permit(:value, :paytime)
  end
end
