class CreateActionGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :action_groups do |t|
      t.references :action, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
