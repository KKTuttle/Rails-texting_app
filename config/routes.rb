Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  resources :contact_books do
    resources :contacts do
      resources :msgs
    end
  end

root :to => 'contact_books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
