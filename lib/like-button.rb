module LikeButton
  def like_button(options = {})
    params = options_to_data_params(default_like_button_options.merge(options))

    html = "".html_safe
    html << content_tag(:div, id: "fb-root")
    html << lik_widgets_js_tag unless @like_widgetized
    html << content_tag(:div, class: "fb-like", params)
  end

  class << self
    attr_accessor :default_like_button_options
  end

  def default_like_button_options
    options = {
      send: "true",
      layout: "button_count",
      width: "450",
      action: "like",
      colorscheme: "light",
      font: "arial"
    }

    options.merge(LikeButton.default_like_button_options || {})
  end

  def like_widgets_js_tag
    @like_widgetized = true

    js_sdk = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=399913006738789"
    '<script src=#{js_sdk} type="text/javascript"></script>'.html_safe
  end

  def like_options_to_data_params(opts)
    params = {}
    opts.each {|k, v| params["data-#{k}"] = v}
    params
  end
end
