Rails.application.routes.draw do
  use_doorkeeper
  root to: 'visitors#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :users

  # api base
  mount Base => '/'
  # do not mount swagger in production
  mount GrapeSwaggerRails::Engine => '/swagger' unless Rails.env.production?
end
