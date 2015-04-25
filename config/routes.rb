Rails.application.routes.draw do
  mount Api => '/'

  devise_for :users

  resources :books do
    resources :chapters, :except => :index do
      resources :sections, :except => :show do
        resources :attachments, :except => [:index, :show]
      end
    end

    post 'sort' => 'books#sort', :as => :sort
  end

  root :to => 'books#index'
end
