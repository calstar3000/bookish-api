class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :author, presence: true, length: { minimum: 5 }
end
