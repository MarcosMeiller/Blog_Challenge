class Post < ApplicationRecord


    validates :title, presence: true
    validates :image, presence: true
    validates :content, presence: true
    validates :date_creation, presence: true
    validates :user_id, presence: true
    validates :category_id, presence: true
end
