Rails.application.routes.draw do
  resources :categories
  root 'ideas#index'
  resources :categories do
    resources :ideas
  end
end