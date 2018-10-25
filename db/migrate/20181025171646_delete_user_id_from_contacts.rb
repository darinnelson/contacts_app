class DeleteUserIdFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :user_id, :string
  end
end
