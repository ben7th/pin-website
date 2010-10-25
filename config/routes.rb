ActionController::Routing::Routes.draw do |map|
  map.root :controller=>"web_sites"
  map.resources :comments
  map.resources :web_site_remarks,:collection=>{:summary=>:post}
  map.resources :web_sites do |web_site|
    web_site.resource :feeling
    web_site.resources :introductions
    web_site.resources :comments
  end

  map.resources :browse_histories
  
  map.sidebar_web_site_info "sidebar/web_site_infos",:controller=>"sidebar/web_site_infos",:action=>"show"

  map.sidebar_browse_histories_infos "sidebar/browse_histories_infos",:controller=>"sidebar/browse_histories_infos",:action=>"index"

  map.sidebar_web_site_detail_info "sidebar/web_site_detail_infos",:controller=>"sidebar/web_site_infos",:action=>"show_detail"

  map.sidebar_web_site_comments "sidebar/web_site_comments",:controller=>"sidebar/web_site_infos",:action=>"comments"
  map.sidebar_web_site_detail_comments "sidebar/web_site_detail_comments",:controller=>"sidebar/web_site_infos",:action=>"comments_detail"

  # 创建评论
  map.sidebar_web_site_comment "sidebar/web_site_comment",:controller=>"sidebar/web_site_infos",:action=>"comment",:conditions=>{:method=>:post}

end
