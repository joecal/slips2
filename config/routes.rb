Rails.application.routes.draw do
  root to: 'sessions#new'

  post '/questions/:question_id/answers', to: 'answers#create', as: 'random_answer'

  resources :answers
  resources :questions do
    resources :answers
  end
  resources :subjects do
    resources :questions
  end
  resources :users
  resource  :session


end
