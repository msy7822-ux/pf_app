class AddImageUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :image_url, :string
    add_column :users, :image_url, 'bytea USING CAST(image_url AS bytea)'
  end
end
