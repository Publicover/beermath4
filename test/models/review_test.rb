require 'test_helper'
require "#{Rails.root}/app/models/review.rb"

class ReviewTest < ActiveSupport::TestCase

  test "review class exists" do
    assert Review
  end

  test "review returns a reviewer" do
    review = reviews(:one)
    assert_equal "JIMTEST", review.reviewer
  end

  test "review returns a body" do
    review = reviews(:two)
    assert_equal "it's good it's good it's good", review.body
  end

  test "review returns a beer_id" do
    review = reviews(:one)
    assert_equal 1, review.beer_id
  end

end
