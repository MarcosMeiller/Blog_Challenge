Rails.application.routes.draw do
  post 'auth/sign_up'
  post 'auth/login'

  resources :posts, only: [:create,:show,:update,:destroy,:index]
  

end
