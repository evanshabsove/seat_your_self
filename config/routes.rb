Rails.application.routes.draw do

  root 'home#index'


  resources :users

  resources :log_in, only: [:index, :create, :destroy]


  resources :restaurants do
    resources :reviews, only: [:show, :create, :destroy]
    resources :reservations
    resources :pictures

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
