class ChangeColumnTypeInTip < ActiveRecord::Migration
  def self.up
    change_column :tips, :description, :text, :limit => nil
  end
  def self.down
    change_column :tips, :description, :string
  end
end
