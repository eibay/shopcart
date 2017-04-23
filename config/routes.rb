Rails.application.routes.draw do
  get 'pages/about'

  resources :line_items
  resources :carts
  resources :products

  post 'updates' => 'updates#data_collect'


  get '/pages/about', to: 'pages#about'

  root "products#index"

end
