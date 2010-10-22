class Sidebar::WebSiteInfosController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  layout nil
  def pre_load
    @web_site = WebSite.find_by_domain(URI.parse(params[:url]).host) if params[:url]
  end

  def show;end

  def show_detail
    render :text=>"detail"
  end

  def comments
    end

  def comments_detail
    render :text=>"comments_detail"
  end

  def comment
    comment = @web_site.comments.new(params[:comment])
    comment.creator = current_user
    if comment.save
      render_ui do |ui|
        ui.mplist :insert,comment,:partial=>"sidebar/web_site_infos/parts/mpinfo_comment",:locals=>{:comment=>comment},:prev=>"TOP"
      end
    end
  end
  
end
