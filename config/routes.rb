Rails.application.routes.draw do
  devise_for :users
  get 'dashboards/index'

  authenticate :user do
    resources :beers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :beers do
    resources :reviews
  end

  root 'dashboards#index'

end
