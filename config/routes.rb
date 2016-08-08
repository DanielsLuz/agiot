Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"

  post "loans/pay/:id", to: "loans#pay", as: 'pay_loan'

  resources :loans do
  end
end
