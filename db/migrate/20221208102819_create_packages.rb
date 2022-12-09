class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :tutorname

      t.timestamps
    end
  end
end
