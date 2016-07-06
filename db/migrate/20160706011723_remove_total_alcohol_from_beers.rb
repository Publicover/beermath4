class RemoveTotalAlcoholFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :total_alcohol, :float
  end
end
