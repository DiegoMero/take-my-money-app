class CreateJoinTableGroupsInvestments < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :investments do |t|
      t.index [:group_id, :investment_id]
      t.index [:investment_id, :group_id]
    end
  end
end
