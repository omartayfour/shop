Rails.application.routes.draw do
  root 'customers#index'

  get  '/upload', to: 'customers#upload'
  post '/upload[:file]', to:'customers#upload_file'

  #resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
