require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end
  
  describe "GET /api/v1/users" do
    it 'リクエストが成功すること' do
      sign_in @user 
      get "/api/v1/users/#{@user.id}"
      expect(JSON.parse(response.body)['user']['name']).to eq(@user.name)
      expect(JSON.parse(response.body)['user']['uid']).to eq(@user.email)
    end
  end
end
