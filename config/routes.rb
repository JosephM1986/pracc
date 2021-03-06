# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'people#index'
  resources :people
  # get :search, controller: :people
  # match '/people' => 'people#curl__get_example', via: :get
  # match '/people' => 'people#curl__post_example', via: :post
  namespace 'api', defaults: { format: :json } do
    resources :people, path: 'temporary_people' do
      collection do
        put :update
        patch :update
      end
    end
  end
end
# namespace 'apitwo', defaults: { format: :json }, constraints: { subdomain: 'stg.assessapp' }, path: '/' do
#   resources :people
# end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
