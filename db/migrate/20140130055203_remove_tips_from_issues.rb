class RemoveTipsFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :tip1, :string
    remove_column :issues, :tip2, :string
    remove_column :issues, :tip3, :string
    remove_column :issues, :tip4, :string
    remove_column :issues, :tip5, :string
  end
end
