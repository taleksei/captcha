lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'captcha/version'

Gem::Specification.new do |spec|
  spec.name    = 'captcha'
  spec.version = Captcha::VERSION
  spec.date    = '2009-03-27'

  spec.summary     = "A Google-style captcha for enterprise Rails apps"
  spec.description = "A Google-style captcha for enterprise Rails apps"

  spec.author   = 'Winton Welsh'
  spec.email    = 'mail@wintoni.us'
  spec.homepage = 'http://github.com/winton/captcha'

  spec.has_rdoc = false

  # = MANIFEST =
  spec.files = %w[
    MIT-LICENSE
    README.markdown
    Rakefile
    captcha.gemspec
    init.rb
    lib/captcha.rb
    lib/captcha/action.rb
    lib/captcha/cipher.rb
    lib/captcha/config.rb
    lib/captcha/generator.rb
    lib/captcha/image.rb
    lib/captcha/model.rb
    resources/captcha.ttf
    spec/lib/captcha_spec.rb
    spec/spec.opts
    spec/spec_helper.rb
    tasks/captcha.rake
  ]

  spec.add_dependency 'rails', '>= 3.2'
  spec.add_dependency 'rmagick', '>=2.9.2'

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'combustion'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "rspec", ">= 3.2"
  spec.add_development_dependency 'simplecov'
end
