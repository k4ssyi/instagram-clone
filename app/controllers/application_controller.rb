class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  #ログインしていない場合はログイン画面に遷移する。
  before_action :authenticate_user!
  #deviseコントローラが動いたら、configure_permitted_parametersを処理する。
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name self_introduction sex img_name))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name self_introduction sex img_name))
  end
end
