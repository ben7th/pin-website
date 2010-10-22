class BrowseHistory < ActiveRecord::Base
  belongs_to :user,:foreign_key => "user_id"
  validates_presence_of :user_id
  validates_presence_of :url

  def self.find_or_create(user,params)
    bh = BrowseHistory.find_by_user_id_and_url(user.id,params['url'])
    return bh if bh
    BrowseHistory.create(:user_id=>user.id,:url=>params['url'],:content=>params['content'])
  end
end
