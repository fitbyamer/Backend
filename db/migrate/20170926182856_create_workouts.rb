class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :media
      t.string :category
      t.string :main_muscle_worked
      t.string :equipment
      t.text :guide
      t.integer :content_type
      t.timestamps
    end
  end
end
