class ChangeDataImageUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :image_url, :binary
  end
end
