Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/  do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  resources :questions do
    resources :answers, except: %[new show]
  end
  root 'pages#index'
  end
end
