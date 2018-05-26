class AlterMembers1 < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :password_digest, :string
  end
end
