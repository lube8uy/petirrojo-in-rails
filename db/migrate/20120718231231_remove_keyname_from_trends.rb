class RemoveKeynameFromTrends < ActiveRecord::Migration
  def up
  	remove_column :trends, :keyname
  	add_index :trends, :name, :unique => true
  end

  def down
  	
  end
end
