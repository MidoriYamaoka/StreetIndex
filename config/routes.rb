Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "locations#index"
	get "locations/index" => "locations#index"
	resources :shops, only: [:show, :index, :mallShop]
	resources :locations, only: [:index, :intro ,:cityscape0, :cityscape1, :gotoprev, :gotonext]
end
