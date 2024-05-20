class AddtitleToflowers < ActiveRecord::Migration[6.1]
  def change
    add_column :flowers, :image, :string
  end
end
