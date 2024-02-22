# frozen_string_literal: true

Rails.application.routes.draw do
  resources :nodes, only: [] do
    get 'common_ancestor', on: :collection
    get 'birds', on: :collection
  end
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
