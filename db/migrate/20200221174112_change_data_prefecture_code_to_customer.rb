class ChangeDataPrefectureCodeToCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :prefecture_code, :string
  end
end
