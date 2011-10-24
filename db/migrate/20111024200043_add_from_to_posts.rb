class AddFromToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :from_email, :string
    add_column :posts, :thankyou_sent, :bool, :default => false
  end
end
