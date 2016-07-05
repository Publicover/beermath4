class AddAbvdollarToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :abv_per_price, :float
  end
end
