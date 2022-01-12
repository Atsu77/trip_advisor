require 'rails_helper'

RSpec.describe 'RegistrationsApis', type: :request do
  describe 'POST /api/v1/auth' do
    context 'パスワードの確認ついて' do
      let(:user) { FactoryBot.build(:user) }

      it 'パスワードと確認用パスワードが同じであればユーザー登録できること' do
        post api_v1_user_registration_path, params: {
          name: user.name,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation,
          confirm_success_url: "https://google.com"
        }
        expect(response).to have_http_status(200)
      end

      it 'パスワードと確認用パスワードが違う場合はユーザー登録できないこと' do
        post api_v1_user_registration_path, params: {
          name: user.name,
          email: user.email,
          password: user.password,
          password_confirmation: 'not_confirmation_password',
          confirm_success_url: "https://google.com"
        }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'POST /api/v1/auth/sign_in' do
    let(:user) { FactoryBot.create(:user) }

    context 'サインインの可否について' do
      it 'メールとパスワードが登録されていたらサインイン出来ること' do
        sign_in user.email, user.password
        expect(response).to have_http_status(200)
      end

      it 'メールとパスワードがサインイン出来ること' do
        sign_in 'email@example.com', 'password'
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'DELETE /api/v1/auth/delete' do
    let(:user) { FactoryBot.create(:user) }
    let(:headers) { user.create_new_auth_token }

    context 'サインアウトについて' do
      it 'リクエストが成功すること' do
        sign_out headers
        expect(user.reload.tokens).to be_blank
        expect(response).to have_http_status(200)
      end
    end
  end
end
