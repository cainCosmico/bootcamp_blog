class RenameFolloweeToFollow < ActiveRecord::Migration[6.1]
  def change
    rename_column :follows, :followee_id, :followed_id
  end
end
