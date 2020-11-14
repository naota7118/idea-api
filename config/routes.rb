Rails.application.routes.draw do
  root 'ideas#index'
  resources :categories do
    resources :ideas
  end
end