class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
