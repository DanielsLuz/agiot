class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :value

      t.timestamps
    end
  end
end
