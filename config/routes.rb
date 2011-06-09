ActionController::Routing::Routes.draw do |map|

  map.resources :maps
  map.resources :me
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
