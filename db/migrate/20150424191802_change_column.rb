class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :posts, :earned, :boolean, :default => false
  end
end
