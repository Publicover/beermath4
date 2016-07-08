class AddBomberToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :bomber, :boolean
  end
end
