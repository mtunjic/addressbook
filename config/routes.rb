Rails.application.routes.draw do

  resources :contacts do 
    collection { post :import }
  end 
  
  devise_for :users
  root to: "contacts#index"

  get '/contacts/search/:query', to: 'contacts#search', as: 'search'
end
