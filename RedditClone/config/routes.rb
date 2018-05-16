Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  resources :subs, only: [:create, :new, :index, :show, :edit, :update]
  resources :posts do
    resources :comments, only: [:new]
  end

end
