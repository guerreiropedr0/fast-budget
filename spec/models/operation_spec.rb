require 'rails_helper'

RSpec.describe Operation, type: :model do
  before :example do
    @user = FactoryBot.create(:user, :confirmed)
    @operation = Operation.create(name: 'Operation 1', amount: 50, author_id: @user.id)
  end

  it 'should be valid with valid attributes' do
    expect(@operation).to be_valid
  end

  it 'should be invalid without a name' do
    @operation.name = nil

    expect(@operation).to be_invalid

    @operation.name = ''

    expect(@operation).to be_invalid
  end

  it 'should be invalid without a name over 100 characters' do
    @operation.name = 'a' * 101

    expect(@operation).to be_invalid
  end

  it 'should be invalid with an amount less than 1' do
    @operation.amount = nil

    expect(@operation).to be_invalid

    @operation.amount = 0

    expect(@operation).to be_invalid
  end

  it 'should be invalid without an author' do
    @operation.author_id = nil

    expect(@operation).to be_invalid
  end
end
