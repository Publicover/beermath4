require 'test_helper'
require "#{Rails.root}/app/models/beer.rb"

class BeerTest < ActiveSupport::TestCase

  test "assert true" do
    true
  end

  test "beer class exists" do
    assert Beer
  end

  test "beer returns a name" do
    beer = beers(:one)
    assert_equal "BeerOne", beer.name
  end

  test "beer returns a brewer" do
    beer = beers(:one)
    assert_equal "BrewerOne", beer.brewer
  end

  test "beer returns a price" do
    beer = beers(:one)
    assert_equal 1000, beer.price
  end

  test "beer returns a ounce" do
    beer = beers(:one)
    assert_equal 10, beer.ounce
  end

  test "beer returns a rating" do
    beer = beers(:one)
    assert_equal 3, beer.rating
  end

  test "beer returns a abv" do
    beer = beers(:one)
    assert_equal 10, beer.abv
  end

end
