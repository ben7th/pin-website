class BrowseHistory < ActiveRecord::Base
  belongs_to :user,:foreign_key => "user_id"
  validates_presence_of :user_id
  validates_presence_of :url

   named_scope :from_size, lambda{ |from,size|
     {:limit=>" #{from},#{size}"}
   }

  # 创建历史记录
  def self.find_or_create(user,params)
    bh = BrowseHistory.find_by_user_id_and_url(user.id,params['url'])
    # 如果已经存在，更新它的时间
    if bh
      bh.update_attributes(:updated_at=>Time.now,:title=>params['title'],:content=>params['content'])
      return bh
    end
    # 尚未创建的新建记录
    BrowseHistory.create(:user_id=>user.id,:url=>params['url'],:title=>params['title'],:content=>params['content'])
  end

  require 'uri'
  def domain
    URI.parse(self.url).host
  end

  def web_site
    WebSite.find_by_domain(domain)
  end

end
