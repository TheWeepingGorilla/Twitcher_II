Rails.application.routes.draw do

  devise_for :users

  root :to => 'twitches#index'
  resources :twitches

end
