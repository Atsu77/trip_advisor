#module RequestSpecHelper
#  def sign_in(email, password)
#    post api_user_session_path, params: {
#      email: email,
#      password: password
#    }
#    binding.pry
#    @header = { uid: response.header['uid'],
#                       access_token: response.header['access-token'],
#                       client: response.header['client'] }
#  end

#  def sign_out(headers)
#    delete destroy_api_v1_user_session_path, headers: headers
#  end
#end

#RSpec.configure do |config|
#  config.include RequestSpecHelper
#end