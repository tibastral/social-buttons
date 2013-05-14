module SocialButtons
  class Railtie < ::Rails::Railtie
    initializer 'social buttons config' do
      ActionView::Base.send :include, ViewHelper
    end
  end
end
