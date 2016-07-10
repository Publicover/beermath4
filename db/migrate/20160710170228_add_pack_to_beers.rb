class AddPackToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :pack, :integer
  end
end
