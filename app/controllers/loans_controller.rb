class LoansController < ApplicationController
  before_action :set_loan, only: [:pay]

  def create
    @loan = Loan.new loan_params
    @loan.to(@current_user)

    if @loan.save
      redirect_to root_path, 
        notice: 
        "Emprestimo processado. Verifique sua situação na aba 'Sua situação'"
    else
      redirect_to root_path, 
        alert: "Emprestimo não aceito! Você deve pagar seu último empréstimo"
    end

  end

  def pay
    @loan.pay
    UserMailer.send_verification_mail
    redirect_to root_path
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :paytime)
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
