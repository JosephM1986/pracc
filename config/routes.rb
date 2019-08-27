# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'people#index'
  match '/people' => 'people#curl__get_example', via: :get
  match '/people' => 'people#curl__post_example', via: :post
  # namespace :api do
  resources :people
  resources :organisations
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
