Rails.application.routes.draw do
  root "static_pages#index"
 
  devise_for :users do
    get "sign_in" => "devise/sessions#new"
    post "sign_in" => "devise/sessions#create"
    delete "sign_out" => "devise/sessions#destroy"
    get
  end
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :products, concerns: :paginatable
    resources :comments
end
