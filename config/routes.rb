Rails.application.routes.draw do
  root 'customers#index'

  get  '/upload', to: 'customers#upload_choices'
  post '/upload[:file]', to:'customers#new'

  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
