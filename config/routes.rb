Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      root 'ideas#index'
      resources :categories do
        resources :ideas
      end
    end
  end
end