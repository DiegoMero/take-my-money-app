require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
      sign_in @user
      get '/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
      sign_in @user
      @group = Group.create(name: 'Facebook', icon: 'Icon', user_id: @user.id)
      get "/groups/#{@group.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
      sign_in @user
      get '/groups/new'
      expect(response).to have_http_status(:success)
    end
  end
end
