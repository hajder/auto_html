AutoHtml.add_filter(:vimeo).with(:width => 440, :height => 248, :show_title => false, :show_byline => false, :show_portrait => false) do |text, options|
  text.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    width  = options[:width]
    height = options[:height]
    show_title      = "title=0"    unless options[:show_title]
    show_byline     = "byline=0"   unless options[:show_byline]  
    show_portrait   = "portrait=0" unless options[:show_portrait]
    api             = "api=1"      if options[:api]
    id = "player_id=#{options[:id]}" if options[:id]
    frameborder     = options[:frameborder] || 0
    query_string_variables = [show_title, show_byline, show_portrait, api, id].compact.join("&")
    query_string    = "?" + query_string_variables unless query_string_variables.empty?

    %{<div class="video vimeo"><iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" id="#{options[:id]}" frameborder="#{frameborder}"></iframe></div>}
  end
end
