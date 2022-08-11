class ChangeAddressDefaultToNil < ActiveRecord::Migration[6.1]
  def change
    change_column_default :addresses, :address, from: 0, to: nil
  end
end
