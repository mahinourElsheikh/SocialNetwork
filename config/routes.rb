Rails.application.routes.draw do
  root 'static_pages#home'

  get    'help' => 'static_pages#help'
  get    'home' => 'static_pages#home'
  get    'about' => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup' => 'users#new'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

<<<<<<< HEAD
=======
  resources :users do
    member do
      get :buddies
      get :received_requests
    end
  end

  resources :posts,      only: [:create, :destroy]
  resources :friends,    only:[:create, :destroy]
  resources :friend_requests,    only:[:create, :destroy]
>>>>>>> friend_request
  get 'advanced_search' => 'advanced_searches#new'
  post 'advanced_search' => 'advanced_searches#create'
  get 'advanced_search/results' => 'advanced_searches#results'

  resources :users do
    member do
      get :likes
      get :buddies
      get :about
    end
  end

  resources :posts, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  
end