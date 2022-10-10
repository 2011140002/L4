Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   get "application/L4"
#   root "application#L4"
  root 'accounts#main'
  get 'accounts/main'
  post 'accounts/login'
  get 'accounts/error'
  post delete 'accounts' ,to: 'accounts#logout'
  
end
