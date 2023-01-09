Rails.application.routes.draw do
  resources :users do
    resources :greetings
  end
  resources :greetings, only: %i[index show]
end
