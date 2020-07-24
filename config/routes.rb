Rails.application.routes.draw do
  resources :temperatures do
   get '/temperatures.xls', to: 'temperatures#export_xlxs', as: 'export' , on: :collection
  end
  resources :languages do
      get '/change_language', to: 'languages#change_language', as: 'change_language', on: :collection

      get '/current_language', to: 'languages#current_language', as: 'c_language', on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'temperatures#index'
end
