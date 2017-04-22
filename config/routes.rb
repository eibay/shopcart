Rails.application.routes.draw do
  resources :products

  post 'updates' => 'updates#data_collect'
  # get 'updates' => 'updates#data_collect'


  root "products#index"

end
