class AddUserToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :user_id, :integer
  end
end
