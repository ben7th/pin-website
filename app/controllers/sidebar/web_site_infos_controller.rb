class Sidebar::WebSiteInfosController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  layout nil
  def pre_load
    @web_site = find_by_url(params[:url]) if params[:url]
  end

  def show;end
  
end
