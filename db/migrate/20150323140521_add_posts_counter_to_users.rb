class AddPostsCounterToUsers < ActiveRecord::Migration
  def up
    add_column :users, :posts_count, :integer, null: false, default: 0
    User.all.each { |u| User.update_counters u.id, posts_count: u.posts.length }
  end

  def down
    remove_column :user, :posts_count
  end
end
