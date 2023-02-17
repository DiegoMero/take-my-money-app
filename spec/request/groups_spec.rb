require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET /index' do

    before do
      @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
      sign_in @user
    end

    it 'returns http success' do
      get '/groups'
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct template' do
      get '/groups'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do

    before do
      @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
      sign_in @user
      @group = Group.create(name: 'Facebook', icon: 'Icon', user_id: @user.id)
    end

    it 'returns http success' do
      get "/groups/#{@group.id}"
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct template' do
      get "/groups/#{@group.id}"
      expect(response).to render_template(:show)
    end
  end
end