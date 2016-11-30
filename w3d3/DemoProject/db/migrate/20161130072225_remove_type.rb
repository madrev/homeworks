class RemoveType < ActiveRecord::Migration
  def change
    remove_column :houses, :type
  end
end
