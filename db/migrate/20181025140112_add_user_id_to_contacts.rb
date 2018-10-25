class AddUserIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :used_id, :string
  end
end
