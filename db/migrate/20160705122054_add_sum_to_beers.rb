class AddSumToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :sum, :integer
  end
end
