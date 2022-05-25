require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    before :example do
      get root_path
    end

    it 'should render index view' do
      expect(response).to render_template(:index)
    end

    it 'should have boilerplate text content' do
      expect(response.body).to include('Fast Budget')
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
