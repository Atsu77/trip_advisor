require 'rails_helper'

RSpec.describe "RegistrationsApis", type: :request do
  describe "POST /api/v1/auth" do
    it "Successful request" do
      user = FactoryBot.build(:user)
      post api_v1_user_registration_path, params: {
        name: user.name,
        email: user.email,
        password: user.password,
        password_confirmation: user.password_confirmation
      }
      expect(response).to have_http_status(200)
    end
  end
end
