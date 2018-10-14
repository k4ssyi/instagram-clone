require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:emiya)
    @other_user = users(:jack)
  end

  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to new_user_session_url
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to new_user_session_url
  end
end
