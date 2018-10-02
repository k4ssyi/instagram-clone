require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get notice Page" do
    get top_notice_path
    assert_response :success
  end

end
