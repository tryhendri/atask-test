class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.string :industry

      t.timestamps
    end
  end
end
