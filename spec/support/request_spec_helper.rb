module RequestSpecHelper
  def sign_in(email, password)
    post api_v1_user_session_path, params: {
      email: email,
      password: password
    }
    users_identify = { uid: response.header['uid'],
                       access_token: response.header['access-token'],
                       client: response.header['client'] }

    return users_identify
  end

  def sign_out(headers)
    delete destroy_api_v1_user_session_path, headers: headers
    return response
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper
end