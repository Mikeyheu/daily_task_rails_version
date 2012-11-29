Taskapp::Application.routes.draw do
  
  root :to => 'lists#index'

  resources :lists, only: [:index, :show, :destroy, :create] do
  end
  resources :tasks, only: [:destroy, :create, :update] do
  	collection do
  		post 'sort'
  	end
    member do
      get 'complete'
    end
  end
end
