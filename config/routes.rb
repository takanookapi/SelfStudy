Rails.application.routes.draw do
  devise_for :users
  root to:'time_reports#index'

  resources :users, only: [:edit, :update]
  resources :time_reports do
    resources :comments, only: [:create, :destroy]
  end
end
