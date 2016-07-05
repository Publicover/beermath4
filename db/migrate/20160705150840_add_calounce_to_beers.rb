class AddCalounceToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :calorie_per_ounce, :float
  end
end
