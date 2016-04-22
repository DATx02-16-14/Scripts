#! /usr/bin/ruby

# Script that enters Hastings.se and creates a game and changes some options

require 'watir-webdriver'
require 'headless'

module GameTest
  def create_game browser
    browser.button(id: 'create-game-btn').wait_until_present
    browser.button(id: 'create-game-btn').click
    browser.text_field(id: 'game-name-field').wait_until_present
    prng = Random.new
    browser.text_field(id: 'game-name-field').set "Best game " + prng.rand(10000).to_s
    browser.text_field(id: 'game-name-field').send_keys :enter
  end

end
