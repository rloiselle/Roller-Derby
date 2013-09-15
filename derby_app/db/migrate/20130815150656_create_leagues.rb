class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :wftda_league_id
      t.string :league_name
      t.string :location
      t.string :url
      t.string :seasons

      t.timestamps
    end
  end
end
