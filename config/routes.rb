Rails.application.routes.draw do

  devise_for :users
  root to: "contacts#index"

  resources :contacts do 
    collection do
      post 'search'
    end
  end
   # Contacts Import & Export 
  resources :import, only: [:index, :show, :import ] do 
    collection { post :csv }
  end 

    # Contact search 
  get '/contacts/search/:query', to: 'contacts#search', as: 'search'
end
