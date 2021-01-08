Rails.application.routes.draw do
  root 'index#index'
  get ':val', to: 'index#palindrome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
