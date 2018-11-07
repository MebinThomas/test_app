Rails.application.routes.draw do



  resources :comments
  resources :users


  #get 'about', to: 'pages#about'

resources :articles
resources :accounts
resources :categories, except: [:destory]


get 'signup', to: 'users#new'
post 'users', to: 'users#create'


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
#resources :users, except: [:new]
end
