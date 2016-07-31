class AddDefaultToLoanPaidField < ActiveRecord::Migration[5.0]
  def change
    change_column :loans, :paid, :boolean, default: false
  end
end
