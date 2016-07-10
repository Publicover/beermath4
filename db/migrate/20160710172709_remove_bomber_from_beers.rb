class RemoveBomberFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :bomber, :boolean
  end
end
