require 'test_helper'
require "#{Rails.root}/app/models/user.rb"

class UserTest < ActiveSupport::TestCase

  test "user class exists" do
    assert User
  end

end
