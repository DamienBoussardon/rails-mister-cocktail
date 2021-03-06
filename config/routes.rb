Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, shallow: [:new, :create, :destroy]
  end
end
