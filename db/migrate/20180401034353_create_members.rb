class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :number, null: false                        # 背番号
      t.string :name, null: false                           # ユーザー名
      t.string :full_name                                   # 本名
      t.string :email                                       # メールアドレス
      t.date :birthday                                      # 生年月日
      t.integer :gender, null: false, default: 0            # 性別 (0:男, 1:女)
      t.boolean :administrator, null: false, default: false # 管理者フラグ
      t.timestamps
    end
  end
end
