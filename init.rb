Core.init_plugin do
  require 'captcha'
  if defined?(Rails) && File.exists?("#{Rails.root}/lib/captcha_config.rb")
    require "#{Rails.root}/lib/captcha_config"
  end

  ActionController::Base.send :include, Captcha::Action
  ActiveRecord::Base.send :include, Captcha::Model
end