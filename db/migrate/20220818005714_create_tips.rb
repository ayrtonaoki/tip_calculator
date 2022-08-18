class CreateTips < ActiveRecord::Migration[7.0]
  def change
    create_table :tips do |t|
      t.float :value
      t.string :description

      t.timestamps
    end
  end
end
