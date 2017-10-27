module Captcha
  class Railtie < Rails::Railtie
    rake_tasks do
      load "#{File.dirname(__FILE__)}/../tasks/captcha.rake"
    end

    initializer "captcha" do |app|
      if defined?(Rails) && File.exists?("#{Rails.root}/lib/captcha_config.rb")
        require "#{Rails.root}/lib/captcha_config"
      end

      ActiveSupport.on_load(:active_record) do
        include Captcha::Model
      end

      ActiveSupport.on_load(:action_controller) do
        include Captcha::Action
      end
    end
  end
end
