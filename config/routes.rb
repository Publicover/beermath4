Rails.application.routes.draw do

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'dashboards/index'

  authenticate :user do
    resources :beers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :beers do
    resources :reviews
  end

  root 'dashboards#index'
  
end
