class ChangeRatingFromNumericToIntegerInReviews < ActiveRecord::Migration[5.2]
  def up
    change_column :reviews, :rating, :integer
  end

  def down
    change_column :reviews, :rating, :numeric
  end
end
