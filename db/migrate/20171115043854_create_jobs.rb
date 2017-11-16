class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
