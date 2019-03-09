class Review < ApplicationRecord
    belongs_to :book
    validates :reviewer, presence: true
    validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :body, presence: true
end
