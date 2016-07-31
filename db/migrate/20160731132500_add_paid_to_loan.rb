class AddPaidToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :paid, :boolean, default: false
  end
end
