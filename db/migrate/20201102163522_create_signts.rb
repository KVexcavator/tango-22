class CreateSignts < ActiveRecord::Migration[6.0]
  def change
    create_table :signts do |t|
      t.references :place, null: false, foreign_key: true
      t.string :activity_type, null: false

      t.timestamps
    end
  end
end
