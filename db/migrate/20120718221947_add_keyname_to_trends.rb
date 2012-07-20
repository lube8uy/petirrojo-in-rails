class AddKeynameToTrends < ActiveRecord::Migration
  def change
  	add_column :trends, :keyname, :string
  	add_index :trends, :keyname, :unique => true
  end
end
