class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.boolean :remote
      t.integer :salary_min
      t.integer :salary_max
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
