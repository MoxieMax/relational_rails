class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publish_date
      t.integer :pages
      t.boolean :in_series
      
      t.timestamps
    end
  end
end
