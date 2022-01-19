Rails.application.routes.draw do
  root "static_pages#index"
 
  devise_for :users do
    get "sign_in" => "devise/sessions#new"
    post "sign_in" => "devise/sessions#create"
    delete "sign_out" => "devise/sessions#destroy"
    get
  end
  resources :products do
    resources :comments
  end
  
end
