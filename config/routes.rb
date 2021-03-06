Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do
  		resources :hooks, only: [:index, :show, :create, :update, :destroy]
  		resources :posts, only: [:index, :show, :create]
    end
  end
end
