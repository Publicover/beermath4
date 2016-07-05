class AddCalpriceToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :calorie_per_price, :float
  end
end
