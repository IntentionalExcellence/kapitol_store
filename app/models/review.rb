class Review < ActiveRecord::Base

  def self.display
    Review.where("display = ?", true)
  end

end