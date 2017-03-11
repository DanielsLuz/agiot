require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes){
    { name: "FooUser" }
  }

  let(:invalid_attributes){
    { name: "" }
  }

  it 'is valid' do
    user = User.new(valid_attributes)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    expect(user).to be_invalid
  end

  context 'with loans' do
    before :each do
      @user = User.create(name: "default")

      @loan1 = Loan.new(value: 1, paytime: 1)
      @loan1.user = @user
      @loan1.save

      @loan2 = Loan.new(value: 2, paytime: 2)
      @loan2.user = @user
      @loan2.save
    end

    it 'has associated loans' do
      expect(@user.loans).to match([@loan1, @loan2])
    end

    it 'has unpaid loans' do
      expect(@user.unpaid_loans?).to be true
    end
  end
end
