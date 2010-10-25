class Sidebar::WebSiteInfosController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  layout "sidebar"
  def pre_load
    @ws_domain = URI.parse(params[:url]).host if params[:url]
    @web_site = WebSite.find_by_domain(@ws_domain) if @ws_domain
  end

  def show;end

  def comments;end

  def comment
    @web_site ||= WebSite.create_web_site(@ws_domain)
    comment = @web_site.comments.new(params[:comment])
    comment.creator = current_user
    if comment.save
      render_ui do |ui|
        ui.mplist :insert,comment,:partial=>"sidebar/web_site_infos/parts/mpinfo_comment",:locals=>{:comment=>comment},:prev=>"TOP"
        ui.page << "jQuery('#comment_content').val('')"
      end
    end
  end
  
end
