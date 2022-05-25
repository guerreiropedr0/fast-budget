require 'rails_helper'

RSpec.describe 'Operations index page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user, :confirmed)
    @group = FactoryBot.create(:group, author_id: @user.id)
    sign_in @user
    visit group_operations_path(group_id: @group.id)
  end

  it 'should display welcoming message' do
    expect(page).to have_content("Operations for #{@group.name}")
  end

  it 'should display all money spent from group\'s operations' do
    expect(page).to have_content('Money spent: $0')
  end

  it 'should display all links' do
    find(:css, 'i.bi.bi-arrow-left')
    find_link 'Add operation'
  end

  it 'should redirect to new operation form when clicking add operation link' do
    click_link 'Add operation'

    expect(page).to have_current_path(new_operation_path)
  end
end
