require 'rails_helper'

RSpec.describe Group, type: :model do
  before :example do
    @user = User.create(name: 'Pedro Guerreiro')
    @group = Group.create(name: 'Group 1', icon: 'www.a_link_for_an_icon.png', author_id: @user.id)
  end

  it 'should be valid with valid attributes' do
    expect(@group).to be_valid
  end

  it 'should be invalid without a name' do
    @group.name = nil

    expect(@group).to be_invalid

    @group.name = ''

    expect(@group).to be_invalid
  end

  it 'should be invalid without a name over 100 characters' do
    @group.name = 'a' * 101

    expect(@group).to be_invalid
  end

  it 'should be invalid without an icon' do
    @group.icon = nil

    expect(@group).to be_invalid

    @group.icon = ''

    expect(@group).to be_invalid
  end

  it 'should be invalid without an author' do
    @group.author_id = nil

    expect(@group).to be_invalid
  end
end
