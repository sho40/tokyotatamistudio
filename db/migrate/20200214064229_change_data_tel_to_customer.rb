class ChangeDataTelToCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :tel, :string
  end
end
