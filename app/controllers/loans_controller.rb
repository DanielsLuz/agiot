class LoansController < ApplicationController
  before_action :mocks_user, only: [:create]

  def index
    @loan = Loan.new
  end

  def create
    @loan = Loan.new loan_params
    @loan.to(@current_user)

    if @loan.save
      redirect_to root_path, notice: "Emprestimo processado."
    else
      redirect_to root_path, alert: "Emprestimo NÃO aceito!"
    end

  end

  private

  def mocks_user
    @current_user = User.first
  end

  def loan_params
    params.require(:loan).permit(:value, :paytime)
  end
end
