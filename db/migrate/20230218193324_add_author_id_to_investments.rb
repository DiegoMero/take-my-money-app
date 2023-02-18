class AddAuthorIdToInvestments < ActiveRecord::Migration[7.0]
  def change
    add_column :investments, :author_id, :integer
    add_index :investments, :author_id
    add_foreign_key :investments, :users, column: :author_id
  end
end
