Rails.application.routes.draw do
  resources :temperatures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'temperatures#index'
end
