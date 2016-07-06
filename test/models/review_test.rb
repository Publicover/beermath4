require 'test_helper'
require "#{Rails.root}/app/models/review.rb"

class ReviewTest < ActiveSupport::TestCase

  test "review class exists" do
    assert Review
  end

end
