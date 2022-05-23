require 'rails_helper'

RSpec.describe User, type: :model do
  before :example do
    @user = FactoryBot.create(:user, :confirmed)
  end

  it 'should be valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'should be invalid without a name' do
    @user.name = nil

    expect(@user).to be_invalid

    @user.name = ''

    expect(@user).to be_invalid
  end

  it 'should be invalid with a name over 100 characters' do
    @user.name = 'a' * 101

    expect(@user).to be_invalid
  end

  it 'should be invalid without an email' do
    @user.email = nil

    expect(@user).to be_invalid

    @user.email = ''

    expect(@user).to be_invalid
  end
end
