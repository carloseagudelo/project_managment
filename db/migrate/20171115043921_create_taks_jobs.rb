class CreateTaksJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :taks_jobs do |t|
      t.references :task, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
