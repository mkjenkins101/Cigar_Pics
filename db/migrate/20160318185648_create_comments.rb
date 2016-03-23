class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pin_id
      t.text :comment
    end
  end
end
