Rails.application.routes.draw do
  devise_for :users do
    get '/login', :to => "devise/sessions#new"
    get '/signup', :to => "devise/registrations#new"
    delete '/logout', :to => "devise/sessions#destroy"
  end

  get 'welcome/index'

  mount Spree::Core::Engine, :at => '/store'

  root to: "welcome#index"
end
