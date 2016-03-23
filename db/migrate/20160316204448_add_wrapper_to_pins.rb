class AddWrapperToPins < ActiveRecord::Migration
  def change
    add_column :pins, :wrapper, :string
  end
end
