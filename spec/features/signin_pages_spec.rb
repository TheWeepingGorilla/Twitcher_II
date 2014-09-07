require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
login_as(user, :scope => :user)

describe "the twitch adding process" do
  it "adds a twitch if a signed-in user inputs one" do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
  visit 'twitches'
  click_button 'add_twitch'
  fill_in 'Content', :with => 'Hello There.'
  click_button 'Create Twitch'
  expect(page).to have_content 'Hello There'

Warden.test_reset!


