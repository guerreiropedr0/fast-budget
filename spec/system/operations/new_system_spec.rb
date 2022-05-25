require 'rails_helper'

RSpec.describe 'Operations new page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user, :confirmed)
    @group = FactoryBot.create(:group, author_id: @user.id)
    sign_in @user
    visit new_operation_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('Create Operation')
  end

  it 'should display all fields' do
    find_field 'Name'
    find_field 'Amount'
    has_select?('Group', with_options: [@group.name])
  end

  it 'should display all links' do
    find(:css, 'i.bi.bi-arrow-left')
    find_button 'Save'
  end

  it 'should create an operation with valid fields' do
    fill_in 'Name', with: 'Food for doggie'
    fill_in 'Amount', with: '55'
    page.select @group.name

    click_button 'Save'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Successfully created an operation.')
  end

  it 'should not create an operation with empty fields' do
    click_button 'Save'

    expect(page).to_not have_content('Successfully created an operation.')
    expect(page).to have_content('Failed to create an operation.')
  end
end
