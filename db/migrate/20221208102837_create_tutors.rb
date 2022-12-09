class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :title
      t.string :image
      t.integer :rating
      t.integer :reviews
      t.integer :nooflesson

      t.timestamps
    end
  end
end
