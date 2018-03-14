class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string     :name
      t.string     :town
      t.timestamp  :deleted_at
      t.timestamps
    end
  end
end
