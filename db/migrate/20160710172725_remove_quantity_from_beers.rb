class RemoveQuantityFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :quantity, :boolean
  end
end
