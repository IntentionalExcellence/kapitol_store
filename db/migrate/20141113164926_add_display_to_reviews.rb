class AddDisplayToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :display, :boolean
  end
end
