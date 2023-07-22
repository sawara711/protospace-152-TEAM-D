class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      #association
      t.integer :user_id
      #prototype name
      t.string :title
      #catch copy
      t.text :catch_copy
      #concept
      t.text :concept
      t.timestamps
    end
  end
end
