Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  resources :users
  resources :profiles
  resources :contacts, only:[:new, :create]
  resources :favorites, only:[:show, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  
  mount LetterOpenerWeb::Engine, at:"/letter_opener" if Rails.env.development?
end
