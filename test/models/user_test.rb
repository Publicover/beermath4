require 'test_helper'
require "#{Rails.root}/app/models/user.rb"

class UserTest < ActiveSupport::TestCase

  test "user class exists" do
    assert User
  end

  test "user has email" do
    user = users(:one)
    assert_equal "test1@test.com", user.email
  end

end
