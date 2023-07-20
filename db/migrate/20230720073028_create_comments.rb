class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      #association
      t.integer :user_id
      t.integer :prototype_id
      #comment
      t.text :text
      t.timestamps
    end
  end
end
