#! /usr/bin/ruby
require 'watir-webdriver'
require 'headless'

# Our test scripts
require './chat_test.rb'
require './game_test.rb'

class Tests
  include ChatTest
  include GameTest
  def chat
    threads = []
    (0..20).each do
      threads << Thread.new do
        headless = Headless.new
        headless.start
        browser = Watir::Browser.new :chrome
        browser.goto 'http://hastings.se'
        Random.new_seed
        prng = Random.new
        browser.alert.set "Watir " + prng.rand(10000).to_s
        browser.alert.ok
        browser.text_field(id: 'input-field-main').wait_until_present

        case prng.rand(2)
        when 0
          chat_test browser, 2500
        when 1
          create_game browser
          chat_test browser, 2500
        else
          chat_test browser, 2500
        end
        browser.close
      end
    end
    threads.each { |thr| thr.join }
  end
end

test = Tests.new
test.chat
