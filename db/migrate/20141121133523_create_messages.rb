class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.point :lonlat, :geographic => true

      t.timestamps
    end
  end
end
