class Sidebar::BrowseHistoriesInfosController < ApplicationController
  before_filter :login_required
  layout nil
  
  def index
    @browse_histories = current_user.browse_histories[0..9]
    cookies[:browse_history_order] = params['order'] if params['order']
    @order = cookies[:browse_history_order] || 'count'
  end
  
end
