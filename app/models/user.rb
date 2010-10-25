class User < UserBase
  has_many :browse_histories,:order=>"updated_at desc"
  has_many :web_site_visits
  has_many :web_sites,:through=>:web_site_visits
end