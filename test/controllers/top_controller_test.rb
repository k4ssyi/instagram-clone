require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:emiya)
  end

  test "should get index" do
    get root_path
    assert_redirected_to new_user_session_url
  end

  test "should get notice Page" do
    get top_notice_path
    #ログイン前
    assert_redirected_to new_user_session_url
    #ログイン後
    sign_in @user
    get top_notice_path
    assert_response :success
  end

end
