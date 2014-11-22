class CreateMessageViews < ActiveRecord::Migration
  def change
    create_table :message_views do |t|
      t.references :user, index: true
      t.references :message, index: true

      t.timestamps
    end
  end
end
