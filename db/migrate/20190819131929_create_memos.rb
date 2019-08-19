class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :date
      t.string :note
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
