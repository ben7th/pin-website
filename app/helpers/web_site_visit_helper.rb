# Methods added to this helper will be available to all templates in the application.
module WebSiteVisitHelper

  def pie_hash
    hash = {}
    current_user.web_site_visits.each do |wsv|
      hash.merge!(wsv.web_site.domain=>wsv.count)
    end
    return hash
  end
  
  def pie_xml(hash)
    str = ''
    str << %`<chart caption='站点访问统计' xAxisName='域名' yAxisName='次数' numberSuffix='次'> `
    hash.each do |key,value|
      str << %` <set label='#{key}' value='#{value}' /> `
    end
    str << "</chart>"
    return str
  end

  def render_pie
    %`
      <div id="chartContainer">loading...</div>
        <script type="text/javascript">
        var myChart = new FusionCharts( "/javascripts/views/fusion_charts/swf/Column3D.swf","myChartId", "300", "300", "0", "1" );
        myChart.setDataXML("#{pie_xml(pie_hash)}");
        myChart.render("chartContainer");
      </script>
    `
  end

end
