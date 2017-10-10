module Captcha
  class Config

    if defined?(Rails)
      PRODUCTION = Rails.env.production? || Rails.env.staging?
      ROOT = "#{Rails.root}/"
    else
      PRODUCTION = false
      ROOT = ""
    end
    ONE_DAY = 24 * 60 * 60

    @@options = {
      :password => 'captcha',
      :colors => {
        :background => '#FFFFFF',
        :font => '#080288'
      },
      # number of captcha images to generate
      :count => PRODUCTION ? 500 : 10,
      :destination => "#{ROOT}public/images/captchas",
      :dimensions => {
        # canvas height (px)
        :height => 32,
        # canvas width (px)
        :width => 110
      },
      :generate_every => PRODUCTION ? ONE_DAY * 1 : ONE_DAY * 10000,
      # http://www.imagemagick.org/RMagick/doc/image2.html#implode
      :implode => 0.2,
      :letters => {
        # text baseline (px)
        :baseline => 25,
        # number of letters in captcha
        :count => 6,
        :ignore => ['a','e','i','o','u','l','j','q','v'],
        # font size (pts)
        :points => 38,
        # width of a character (used to decrease or increase space between characters) (px)
        :width => 17
      },
      :ttf => File.expand_path("#{File.dirname(__FILE__)}/../../resources/captcha.ttf"),
      # http://www.imagemagick.org/RMagick/doc/image3.html#wave
      :wave => {
        # range is used for randomness (px)
        :wavelength => (40..70),
        # distance between peak and valley of sin wave (px)
        :amplitude => 3
      },
      :update_files_time => 15.minutes.ago
    }

    def initialize(options={})
      @@options.merge!(options)
    end

    @@captchas = {time: 1.month.ago, files: []}

    def self.captchas
      if @@captchas[:files].blank? || @@captchas[:time] < @@options[:update_files_time].since
        @@captchas[:files] = Dir["#{@@options[:destination]}/*.jpg"]
        @@captchas[:time] = Time.now
      end

      @@captchas[:files]
    end

    def self.remove_old_capchas
      @@captchas[:files].each do |captcha|
        FileUtils.rm_f captcha
      end
    end

    def self.codes
      self.captchas.collect do |f|
        File.basename f, '.jpg'
      end
    end

    def self.exists?(code)
      File.exists?("#{@@options[:destination]}/#{code}.jpg")
    end

    def self.options
      @@options
    end

    def self.last_modified
      @@captchas[:time]
    end
  end
end
