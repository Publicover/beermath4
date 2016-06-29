Rails.application.routes.draw do
  get 'dashboards/index'

  resources :beers do
    resources :reviews
  end

  root 'dashboards#index'

end
