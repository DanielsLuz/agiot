class AddPaytimeToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :paytime, :integer
  end
end
