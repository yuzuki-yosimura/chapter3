class Book < ApplicationRecord
  validates :title, :body, presence:{ message: "must be filled in"}
end
