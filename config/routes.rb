PhotoApp::Application.routes.draw do
  root to: 'pages#home'

  get 'ui(/:action)', controller: 'ui'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :entries, except: [:destroy]
  resources :users, only: [:create, :show, :edit]
end
