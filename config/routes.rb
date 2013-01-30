Codejammin::Application.routes.draw do
  resources :events


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :skip => [:sessions],  :controllers => { :registrations => "registrations" }
  resources :users

  get 'signup_confirmation' => 'home#signup_confirmation'
end
