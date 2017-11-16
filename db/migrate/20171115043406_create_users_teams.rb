class CreateUsersTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :users_teams do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :lead, default: false

      t.timestamps
    end
  end
end
