class ChangeDataAddressToAddress < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :address, :string
  end
end
