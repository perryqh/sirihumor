Sirihumor::Application.routes.draw do
  resources :posts, :only => [:index, :create, :new, :show]
  root :to => 'posts#index'
end
