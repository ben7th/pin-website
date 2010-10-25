# Methods added to this helper will be available to all templates in the application.
module WebSiteHelper
  def web_site_introduction_info(web_site)
    introduction = web_site.introduction
    return "暂无内容" if introduction.blank?
    introduction.content.markdown_to_html
  end
end
