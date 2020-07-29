class Cat < ActiveRecord::Base 
    has_many :cat_food_reviews
    has_many :pet_food_stores, through: :cat_food_reviews
end