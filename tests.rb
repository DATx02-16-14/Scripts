#! /usr/bin/ruby
require 'watir-webdriver'

require './chat_test.rb'

class Tests
  include ChatTest
  def chat
    threads = []
    for i in 0..5
      threads << Thread.new {
        browser = Watir::Browser.new :chrome
        browser.goto 'http://hastings.se'
        Random.new_seed
        chat_test browser
      }
    end
    threads.each { |thr| thr.join }
  end
end

test = Tests.new
test.chat
