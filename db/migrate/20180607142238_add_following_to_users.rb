class AddFollowingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :following, :text
  end
end
