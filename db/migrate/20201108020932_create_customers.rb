class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :phonenumber
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
