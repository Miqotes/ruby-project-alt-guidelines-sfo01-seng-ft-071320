class PetFoodStore < ActiveRecord::Base
  has_many :cat_food_reviews
  has_many :cats, through: :cat_food_reviews
end