class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :isbn
      t.decimal :price
      t.string :category
      t.boolean :publish

      t.timestamps
    end
  end
end
