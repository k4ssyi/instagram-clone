require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:emiya)
  end

  test "login with invalid information" do
     get new_user_session_path
     assert_template 'devise/sessions/new'
     post user_session_path, params: { user: { email: "", password: "" } }
     assert_template 'devise/sessions/new'
     assert_not flash.empty?
     get root_path
     assert_not flash.empty?
   end

   test "login with valid information followed by logout" do
     get new_user_session_path
     post user_session_path, params: { user: { email:    @user.email,
                                           password: 'password' } }
     assert_redirected_to root_url
     follow_redirect!
     assert_template 'top/index'
     delete destroy_user_session_path
     assert_redirected_to root_url
     follow_redirect!
   end
end
