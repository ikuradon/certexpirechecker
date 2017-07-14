class CreateInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :instances do |t|
      t.string :domain
      t.string :note
      t.datetime :not_before
      t.datetime :not_after
      t.datetime :updated_at

      t.timestamps
    end
  end
end
