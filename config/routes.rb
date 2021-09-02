Rails.application.routes.draw do

  resources :contacts
  
  devise_for :users
  root to: "contacts#index"

  resources :import, only: [:index, :show ] do 
    collection { post :csv }
  end 

  get '/contacts/search/:query', to: 'contacts#search', as: 'search'
end
