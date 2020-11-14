Rails.application.routes.draw do
  resources :ideas
  root 'ideas#index'
  # namespace :api do
  #   resources :ideas, defaults: { format: 'json'}
  # end
end
