class AddClicksToTrends < ActiveRecord::Migration
  def change
  	add_column :trends, :clicks, :integer
  end
end
