require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
     get new_user_session_path
     assert_template 'devise/sessions/new'
     post user_session_path, params: { session: { email: "", password: "" } }
     assert_template 'devise/sessions/new'
     assert_not flash.empty?
     get root_path
     assert_not flash.empty?
   end
end
