Rails.application.routes.draw do
  namespace :admin do
    devise_for :users, skip: [:passwords, :registrations], controllers: {
      sessions: 'admin/sessions'
    }, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
    }

    get '/' => 'home#index'

    resources :users, except: :show
    resources :articles, except: :show

    match '*unmatched', to: 'application#not_found', via: :all
  end

  get 'home/index'
  root 'home#index'
end
