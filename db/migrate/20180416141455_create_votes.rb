class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :entry, null: false  # 外部キー
      t.references :member, null: false # 外部キー

      t.timestamps null: false
    end
  end
end
