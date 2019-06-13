Rails.application.routes.draw do
  root to: "long_uris#new"
  get '/:short_url' => "long_uris#show"
  resources :long_uris, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
