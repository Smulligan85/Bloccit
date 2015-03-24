class AddCommentsCounterToUsers < ActiveRecord::Migration
  def up
    add_column :users, :comments_count, :integer, null: false, default: 0
    User.all.each { |u| User.update_counters u.id, comments_count: u.comments.length }
  end

  def down
    remove_column :user, :comments_count
  end
end
