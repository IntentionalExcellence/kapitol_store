Rails.application.routes.draw do
  get 'welcome/index'

  mount Spree::Core::Engine, :at => '/store'

  root to: "welcome#index"
end
