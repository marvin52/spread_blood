Rails.application.routes.draw do
  root 'home#index'

  # Account Devise
  devise_for :users,
    path: 'account',
    controllers: {
      registrations: "account/registrations",
      sessions: "account/sessions"
    },
    path_names: {
      sign_up: 'sign-up',
      sign_in: 'sign-in',
      sign_out: 'sign-out',
      password: 'password',
      confirmation: 'verify',
      edit: 'settings'
    }
  get '/@:username', to: 'account#show', as: 'profile'
  get '/timeline', to: 'timeline#index'
  get '/ranking', to: 'ranking#index'
  get '/FAQ', to: 'home#faq', as: 'faq'
  resources :donations
  get '/donations/:id/destroy', to: 'donations#destroy', as: 'destroy_donation'
end
