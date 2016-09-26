Rails.application.routes.draw do
  devise_for :users

  resources :contact_books do
    resources :contacts do
      resources :msgs
    end
  end

root :to => 'contact_books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
