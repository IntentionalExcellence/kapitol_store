class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
