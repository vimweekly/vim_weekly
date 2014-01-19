class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :tip1
      t.string :tip2
      t.string :tip3
      t.string :tip4
      t.string :tip5

      t.timestamps
    end
  end
end
