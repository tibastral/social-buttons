module TweetButton
  TWITTER_SHARE_URL = "http://twitter.com/share"

  def tweet_button(options = {})
    params = tweet_options_to_data_params(default_tweet_button_options.merge(options))

    html = "".html_safe
    html << tweet_widgets_js_tag unless @tweet_widgetized
    html << link_to("Tweet", TWITTER_SHARE_URL, params)
  end

  class << self
    attr_accessor :default_tweet_button_options
  end

  def default_tweet_button_options
    options = {
      url: request.url,
      via: "tweetbutton",
      text: "",
      related: "",
      count: "vertical",
      lang: "en"
    }

    options.merge(TweetButton.default_tweet_button_options || {})
  end

  def tweet_widgets_js_tag
    @tweet_widgetized = true
    twitter_wjs = "http://platform.twitter.com/widgets.js"
    '<script src=#{twitter_wjs} type="text/javascript"></script>'.html_safe
  end

  def tweet_options_to_data_params(opts)
    params = {}
    opts.each {|k, v| params["data-#{k}"] = v}

    params['class'] = 'twitter-share-button'
    params
  end
end
