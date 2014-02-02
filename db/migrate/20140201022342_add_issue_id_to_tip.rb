class AddIssueIdToTip < ActiveRecord::Migration
  def change
    add_column :tips, :issue_id, :integer
  end
end
