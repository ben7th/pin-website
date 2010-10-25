class WebSiteRemarksController < ApplicationController

  before_filter :pre_load

  def index
    @remarks = @web_site.comments
  end

  def create
    @remark = @web_site.comments.new(params[:comment])
    @remark.creator = current_user
    if @remark.save
      return _insert_mplist
    end
  end

  def _insert_mplist
    render_ui do |ui|
      ui.mplist :insert,[@web_site,@remark],:partial=>"comments/parts/mpinfo_comment",:prev=>"TOP"
      ui.page << "$('comment_content').value = ''"
    end
  end


  def pre_load
      @web_site = WebSite.find(params[:web_site_id]) if params[:web_site_id]
  end
end
