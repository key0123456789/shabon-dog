class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string     :summary
      t.string     :note
      t.integer    :category, default: 0
      t.datetime   :start_at, null: false
      t.datetime   :end_at,   null: false
      t.references :schedule, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
