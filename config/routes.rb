Rails.application.routes.draw do
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
end
