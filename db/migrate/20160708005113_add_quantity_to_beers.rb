class AddQuantityToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :quantity, :boolean
  end
end
