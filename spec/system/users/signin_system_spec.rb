require 'rails_helper'

RSpec.describe 'Sign in page', type: :system do
  before :example do
    driven_by(:rack_test)
    visit new_user_session_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('Log in')
  end

  it 'should display all fields' do
    find_field('Email')
    find_field('Password')
    find_button('Log in')
  end

  it 'should display errors if all or one of the fields are blank' do
    click_button('Log in')

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'should display errors if email or password is invalid' do
    fill_in 'Email', with: 'pedro@mail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'should sign in with valid email and password' do
    @user = FactoryBot.create(:user, :confirmed)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_current_path(groups_path)
  end
end
