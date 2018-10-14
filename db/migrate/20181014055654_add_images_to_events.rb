class AddImagesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :images, :string, array: true, default: []
  end
end
