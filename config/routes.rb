Rails.application.routes.draw do
  # root 'ideas#index'
  namespace 'api' do
    namespace 'v1' do
      resources :categories do
        resources :ideas do
          resources :idea_categories
        end
      end
    end
  end
end