class AddReleaseDateToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :release_date, :string
  end
end
