class AddActiveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :active, :bool, :default => false
  end
end
