Rails.application.routes.draw do

  resources :articles do
  resources :comments, only[:create, :update, :destroy]
  end
  devise_for :users

  root 'welcome#index'

end
