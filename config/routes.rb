Rails.application.routes.draw do
  get 'health/index'
  devise_for :users, defaults: { format: :json }

  get '/member-data', to: 'members#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
