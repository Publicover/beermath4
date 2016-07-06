require 'test_helper'
require "#{Rails.root}/app/models/beer.rb"

class BeerTest < ActiveSupport::TestCase

  # def setup
  #   @beer = beers(:one)
  # end

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

end
