class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0, null: false, limit: 1
    # 一般権限となるdefaultは0としてAdmin権限は1とする。
  end
end
