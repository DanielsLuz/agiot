require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  context 'giving a loan with correct values' do
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

  context 'validating an asked loan' do
    before :each do
      User.create!(name: "Foo")
    end

    let(:valid_attributes){
      { value: 1, paytime: 1 }
    }

    it 'accepts if last loan is finished' do
      post :create, params: { loan: valid_attributes }
      expect(Loan.all.size).to eq(1)

      Loan.first.pay

      post :create, params: { loan: valid_attributes }
      expect(Loan.all.size).to eq(2)
    end

    it 'denies if last loan is open' do
      post :create, params: { loan: valid_attributes }
      expect(Loan.all.size).to eq(1)

      post :create, params: { loan: valid_attributes }
      expect(Loan.all.size).to eq(1)
    end
  end

  context 'paying a loan' do
    before :each do
      User.create!(name: "Foo")
      @loan = Loan.new( value: 1, paytime: 1 )
      @loan.to(User.first)
      @loan.save
    end

    it 'pays an opened loan' do
      expect(@loan.paid).to be false
      post :pay, params: { id: @loan.id }
      @loan.reload
      expect(@loan.paid).to be true
    end
  end
end
