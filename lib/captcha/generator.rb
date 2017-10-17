module Captcha
  class Generator
    def initialize
      generate
    end

    def generate
      return unless Config.options
      return if Config.last_modified && Config.last_modified > Time.now - Config.options[:generate_every]
      path = Config.options[:destination]
      FileUtils.mkdir_p path

      Config.remove_old_capchas

      (1..Config.options[:count]).each_with_index do |x, index|
        image = Image.new Config.options
        path = "#{Config.options[:destination]}/#{Cipher.encrypt(image.code)}.jpg"
        next if File.exists?(path)
        image.data.force_encoding('ASCII-8BIT')
        File.open(path, 'w') do |f|
          f.set_encoding('ASCII-8BIT')
          f << image.data
        end
      end
      GC.start
    end
  end
end
