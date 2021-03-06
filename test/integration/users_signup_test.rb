require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "invalid signup information" do
      get new_user_registration_path
      assert_no_difference 'User.count' do
        post user_registration_path, params: { user: { name:  "",
                                           email: "user@invalid",
                                           password:              "foo",
                                           password_confirmation: "bar" } }
      end
      assert_template 'devise/registrations/new'
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'top/index'
    assert_not flash.empty?
  end
end
