Rails.application.routes.draw do
  use_linked_rails_auth
  use_linked_rails
  find_tenant_route
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
