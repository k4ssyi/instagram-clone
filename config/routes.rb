Rails.application.routes.draw do
  root 'static_pages#home'
  get '/notice', to: 'static_pages#notice'
  get '/about', to: 'static_pages#about'
  
  get '/signup', to: 'users#new'
end
