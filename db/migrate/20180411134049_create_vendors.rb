class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.belongs_to :avatar
      t.string     :name
      t.string     :town
      t.string     :description
      t.timestamp  :deleted_at
      t.timestamps
    end
  end
end
