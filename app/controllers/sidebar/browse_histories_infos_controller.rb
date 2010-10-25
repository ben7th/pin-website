class Sidebar::BrowseHistoriesInfosController < ApplicationController
  before_filter :login_required
  layout nil
  
  def index
    @browse_histories = current_user.browse_histories[0..9]
  end
  
end
