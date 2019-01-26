Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  resources :users
  resources :profiles
  resources :contacts
  resources :favorites, only:[:show, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at:"/letter_opener" if Rails.env.development?
end
