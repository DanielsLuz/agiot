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
end
