class AddShapeLengthRingToPins < ActiveRecord::Migration
  def change
    add_column :pins, :shape, :string
    add_column :pins, :length, :string
    add_column :pins, :ring, :string
  end
end
