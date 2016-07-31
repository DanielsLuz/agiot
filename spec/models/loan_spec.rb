require 'rails_helper'

RSpec.describe Loan, type: :model do
  before :all do
    @user = User.create!(name: "John")
  end

  let(:valid_attributes){
    { value: 1, paytime: 1, user_id: @user.id }
  }

  let(:invalid_attributes){
    { value: nil, paytime: nil, user_id: @user.id }
  }

  it 'is valid' do
    loan = Loan.new(valid_attributes)
    expect(loan).to be_valid
  end

  it 'is invalid without a value' do
    loan = Loan.new(invalid_attributes)
    loan.paytime = 1
    expect(loan).to be_invalid
  end

  it 'is invalid without a paytime' do
    loan = Loan.new(invalid_attributes)
    loan.value = 100
    expect(loan).to be_invalid
  end

  it 'must belong to an user' do
    loan = Loan.new(valid_attributes)
    loan.user = nil
    expect(loan).to be_invalid
  end

  it 'creates an unpaid loan' do
    loan = Loan.new(valid_attributes)
    expect(loan.paid).to be false
  end

  it 'converts paid situation to string' do
    loan = Loan.new(valid_attributes)
    expect(loan.paid_text).to eq("Aberto")

    loan.pay
    expect(loan.paid_text).to eq("Pago!")
  end
end
