class Posts < ActiveRecord::Migration
  def up
     create_table :posts do |t|
      t.string :screenshot

      t.timestamps
    end
  end

  def down
  end
end
