Rails.application.routes.draw do
  devise_for :users
  root "cocktails#index"
  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
