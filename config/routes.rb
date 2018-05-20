Rails.application.routes.draw do
  get 'home/index'
  get 'test/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to: 'test#index'
end
