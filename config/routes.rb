Rails.application.routes.draw do
  get '/health', to: 'health#health'

  mount Weather::API => '/weather'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
