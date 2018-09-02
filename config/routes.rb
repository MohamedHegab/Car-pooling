Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    constraints RoleRouteConstraint.new { |user| user.has_role? :driver } do
      get 'dashboard', to: 'driver_dashboards#show'
    end

    constraints RoleRouteConstraint.new { |user| user.has_role? :passenger } do
  	  get 'dashboard', to: 'passenger_dashboards#show'
    end
    
    get 'dashboard', to: 'home#home'

    resources :trips
    resources :places
    resources :pickups
    root to: redirect('/dashboard', status: 302)
  end
end
