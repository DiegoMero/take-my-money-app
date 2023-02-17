class CreateJoinTableGroupsAction < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :actions do |t|
      t.index [:group_id, :action_id]
      t.index [:action_id, :group_id]
    end
  end
end
