class AddAbvcalToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :abv_per_cal, :float
  end
end
