Weatherdisplayapp::Application.routes.draw do
  root :to => 'weather#index'
  get "weather/index", :as => 'index'
  get "weather/query", :as => 'query'
  get "weather/query/:zipcode" => 'weather#query'
end
