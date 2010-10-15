ActionController::Routing::Routes.draw do |map|
  map.root :controller=>"web_sites"
  map.resources :comments
  map.resources :web_site_remarks,:collection=>{:summary=>:post}
  map.resources :web_sites do |web_site|
    web_site.resource :feeling
    web_site.resources :introductions
  end
  
end
