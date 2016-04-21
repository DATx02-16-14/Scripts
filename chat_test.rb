#! /usr/bin/ruby

# Basic script that opens 10 sessions to hastings.se and writes to the chat 25 times.
require 'watir-webdriver'

module ChatTest

  def chat_test (browser)
    prng = Random.new
    browser.alert.set "Watir" + prng.rand(10000).to_s
    browser.alert.ok

    browser.text_field(id: 'input-field-main').wait_until_present
    for i in 1..25
      browser.text_field(id: 'input-field-main').set "Chatting whoho"
      browser.text_field(id: 'input-field-main').send_keys :enter
    end
    browser.close
  end
end
