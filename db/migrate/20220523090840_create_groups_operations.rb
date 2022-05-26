class CreateGroupsOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_operations do |t|
      t.belongs_to :group
      t.belongs_to :operation

      t.timestamps
    end
  end
end
