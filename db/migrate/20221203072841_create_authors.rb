class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :alive
      t.string :hometown
      t.integer :age_published
      
      t.timestamps
    end
  end
end
