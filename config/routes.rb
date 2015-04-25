Rails.application.routes.draw do
  mount Api => '/'

  devise_for :users

  resources :books do
    resources :chapters, :except => :index do
      resources :sections, :except => :show
    end

    post 'sort' => 'books#sort', :as => :sort
  end

  root :to => 'books#index'
end
