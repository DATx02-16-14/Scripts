#! /usr/bin/ruby

# Basic script that opens 10 sessions to hastings.se and writes to the chat 25 times.
require 'watir-webdriver'
require 'headless'

module ChatTest
  def chat_test browser
    browser.text_field(id: 'input-field-main').wait_until_present 100
    (1..25).each do
      browser.text_field(id: 'input-field-main').set "Chatting whoho"
      browser.text_field(id: 'input-field-main').send_keys :enter
    end
    chatName = (0...15).map { ('a'..'z').to_a[rand(26)] }.join
    browser.text_field(id: 'input-field-main').set "joining " + chatName
    browser.text_field(id: 'input-field-main').send_keys :enter
    browser.text_field(id: 'input-field-main').set "/join " + chatName
    browser.text_field(id: 'input-field-main').send_keys :enter
    browser.text_field(id: 'input-field-' + chatName).wait_until_present 100
    (1..10).each do
      browser.text_field(id: 'input-field-' + chatName).set "Chatting in " + chatName + "whoho"
      browser.text_field(id: 'input-field-' + chatName).send_keys :enter
    end
  end
end
