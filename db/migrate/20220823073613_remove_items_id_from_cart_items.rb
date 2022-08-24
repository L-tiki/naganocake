class RemoveItemsIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :items_id, :integer
  end
end
