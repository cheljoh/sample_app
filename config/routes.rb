Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'signup'     => 'users#new'

  get 'help'       => 'static_pages#help'
  get 'about'      => 'static_pages#about'
  root                'static_pages#home'
  get 'contact'    => 'static_pages#contact'
  get 'login'      => 'sessions#new'
  post 'login'     => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
end
