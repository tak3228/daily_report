class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
