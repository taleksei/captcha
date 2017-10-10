$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
require 'simplecov'
SimpleCov.start do
  minimum_coverage 70
end

require 'pry'

require 'captcha'

require 'combustion'
Combustion.initialize! :all

require 'rspec'
