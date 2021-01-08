Rails.application.routes.draw do
  get 'index/view'
  root  'index#input'
  get 'index/input'
  get 'data', to: 'index#view'
end
