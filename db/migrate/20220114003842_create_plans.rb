class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.datetime :departure_date, null: false
      t.datetime :return_home_day, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
