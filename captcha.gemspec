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

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

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
