require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  def setup
    @user = users( :john )
    sign_in(@user)
  end
end
