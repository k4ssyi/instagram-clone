require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:emiya)
  end

  test "micropost interface" do
    sign_in users(:emiya)
    get root_path
    # 無効な送信
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "" } }
    end
    # 有効な送信
    content = "This micropost really ties the room together"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:jack))
    assert_select 'a', text: 'delete', count: 0
  end
end
