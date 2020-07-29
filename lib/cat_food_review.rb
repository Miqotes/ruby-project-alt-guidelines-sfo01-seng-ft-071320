class CatFoodReview < ActiveRecord::Base
  belongs_to :pet_food_store
  belongs_to :cat
end