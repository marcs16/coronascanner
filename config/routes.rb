Rails.application.routes.draw do
  resources :emptemperatures do 
    get '/emptemperatures.xls', to: 'emptemperatures#export_xlxs_daily' , as: 'export_employes', on: :collection
  end
  get 'welcome/index'
  
  resources :temperatures do
   get '/temperatures.xls', to: 'temperatures#export_xlxs', as: 'export_users' , on: :collection
  end

  resources :languages do
      get '/change_language', to: 'languages#change_language', as: 'change_language', on: :collection

      get '/current_language', to: 'languages#current_language', as: 'c_language', on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
