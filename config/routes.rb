Rails.application.routes.draw do

  resources :posts
  resources :bloggers
  resources :destinations

  get 'posts/:id/button', to: 'posts#click', as: 'button'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
