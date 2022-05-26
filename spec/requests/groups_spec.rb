require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :example do
    @user = FactoryBot.create(:user, :confirmed)
    sign_in @user
  end

  describe 'GET /index' do
    before :example do
      get groups_path
    end

    it 'should render index view' do
      expect(response).to render_template(:index)
    end

    it 'should have boilerplate text content' do
      expect(response.body).to include('Groups')
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /groups/new' do
    before :example do
      get new_group_path
    end

    it 'should render new view' do
      expect(response).to render_template(:new)
    end

    it 'should have boilerplate text content' do
      expect(response.body).to include('Create Group')
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
