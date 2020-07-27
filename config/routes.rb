Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'users/new'
  get '/job-post', to: 'employer#job-post'
  get '/new-post', to: 'employer#new-post'
  get '/create-cv', to: 'employer#create-cv'
  get '/home', to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/all', to: 'static_pages#products'
  namespace :admin do
    root "admin#index"
  end
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end

