require 'rails_helper'


include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
login_as(user, :scope => :user)



Warden.test_reset!
