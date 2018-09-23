require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Instagram Clone"
    assert_equal full_title("Notice"), "Notice | Instagram Clone"
  end
end