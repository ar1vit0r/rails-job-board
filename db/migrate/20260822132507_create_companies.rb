class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
