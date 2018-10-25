class ChangeUsedIdtoUserIdInContacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :used_id, :user_id
  end
end
