Rails.application.routes.draw do
  get 'version/index'
  get 'home/index'
  get 'test/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to: 'test#index'
  get '/version', to: 'version#index'
end
