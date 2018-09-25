Rails.application.routes.draw do
  root 'top#index'
  get 'top/notice'
  devise_for :users
end
