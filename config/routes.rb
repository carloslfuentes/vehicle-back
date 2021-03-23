Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: 'api/v1', path: 'api/v1', as: :private_v1, defaults: { format: :json } do
    resources :vehicle_brands, only: %i[show create update index destroy]
    resources :vehicle_models, only: %i[show create update index destroy]
    resources :vehicles, only: %i[show create update index destroy]
  end

end
