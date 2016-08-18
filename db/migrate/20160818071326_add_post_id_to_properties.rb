class AddPostIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :post_id, :integer
  end
end
