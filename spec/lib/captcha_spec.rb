require 'spec_helper'

describe :captcha do
  let(:delay) { 4 }
  let(:generator) { Captcha::Generator.new }

  around do |example|
    begin
      Captcha::Config.new(generate_every: 2.seconds, update_files_time: 1.seconds )
      generator
      sleep 2

      example.run
    ensure
      FileUtils.rm_rf(Captcha::Config.options[:destination])
    end
  end

  it "should generate captchas" do
    expect(Captcha::Config.codes.length).to eq(10)
  end

  it "should generate fresh captchas if the files are older than the generate_every option" do
    codes = Captcha::Config.codes.dup
    sleep delay
    generator.generate
    expect(Captcha::Config.codes).not_to match_array codes
  end

  it "should not regenerate before the files are older than the generate_every option" do
    codes = Captcha::Config.codes.dup
    sleep 1
    generator.generate
    expect(Captcha::Config.codes).to match_array codes
  end

  it "should not allow more than the captcha limit to exist" do
    sleep delay
    generator.generate
    expect(Captcha::Config.codes.length).to eq 10
  end
end
