class ChangePasswordandPasswordConfirmationtoPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_confirmation, :string
    rename_column :users, :password, :password_digest
  end
end
