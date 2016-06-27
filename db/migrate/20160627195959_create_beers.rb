class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewer
      t.integer :price
      t.integer :ounce
      t.integer :calorie
      t.integer :rating

      t.timestamps null: false
    end
  end
end
