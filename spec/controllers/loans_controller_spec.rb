require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  before :each do
    User.create!(name: "Foo")
  end

  let(:valid_attributes){
    { value: 1, paytime: 1 }
  }

  let(:new_attributes){
    { value: 2, paytime: 2 }
  }

  it 'creates a new loan' do
    post :create, params: { loan: valid_attributes }
    expect(Loan.all.size).to eq(1)
  end

  it 'creates loan with value given' do
    post :create, params: { loan: valid_attributes }
    expect(Loan.last.value).to eq(1)
  end

  it 'created loan has a paytime associated' do
    post :create, params: { loan: valid_attributes }
    expect(Loan.last.paytime).to eq(1)
  end
end
