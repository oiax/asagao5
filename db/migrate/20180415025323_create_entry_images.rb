class CreateEntryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_images do |t|
      t.references :entry                          # 外部キー
      t.string :alt_text, null: false, default: "" # 代替テキスト

      t.timestamps
    end
  end
end
