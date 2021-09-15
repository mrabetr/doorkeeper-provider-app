# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper do
    # the custom applications controller isn't needed but can be used to customise things
    # controllers applications: 'oauth_applications'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :customers

  # Project administration via UI
  resources :projects

  namespace :api do
    namespace :v1 do
      resources :projects
      resources :notes
      get '/me' => 'credentials#me'
      get '/application' => 'credentials#application'
    end
  end

  root to: 'home#index'
end
