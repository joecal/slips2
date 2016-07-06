Rails.application.routes.draw do
  root to: 'sessions#new'

  # post "/users/1/answers" => "answers#create", as: "random_answer"
  # post '/users/:user_id/answers', to: 'answers#create', as: 'random_answer'

  resources :answers
  resources :questions do
    resources :answers
  end
  resources :subjects do
    resources :questions
  end
  resources :users do
      resources :answers
  end

  resources :users
  resource  :session


end
