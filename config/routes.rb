Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'home#index'
  authenticate :user do
    resources :timelines, only: [:index, :show]
  end
end
