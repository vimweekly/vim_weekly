class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :author
      t.string :code
      t.string :summary
      t.string :description

      t.timestamps
    end
  end
end
