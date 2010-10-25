class Sidebar::WebSiteInfosController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  layout "sidebar"
  def pre_load
    @web_site = WebSite.find_by_domain(URI.parse(params[:url]).host) if params[:url]
  end

  def show;end

  def comments;end

  def comment
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
