Rails.application.routes.draw do
  root "static_pages#index"
  resources :static_pages
  devise_for :users do
    get "sign_in" => "devise/sessions#new"
    post "sign_in" => "devise/sessions#create"
    delete "sign_out" => "devise/sessions#destroy"
  end
  namespace :admin do 
    resources :products do
      resources :comments
    end
  end
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :products do
    resources :comments
    member do 
      get :destroy
    end
  end
end
