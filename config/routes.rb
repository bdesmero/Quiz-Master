Rails.application.routes.draw do
  root 'homes#index'
  resources :questions
  resources :quizzes, only: [:new, :destroy] do
    post :submit_quiz, on: :collection
    get :quiz_result, on: :collection
  end
end
