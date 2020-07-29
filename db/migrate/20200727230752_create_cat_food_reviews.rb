class CreateCatFoodReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_food_reviews do |t|
      t.string :brand_name
      t.text :review 
      t.integer :rating
      t.integer :cat_id
      t.integer :pet_food_store_id
    end
  end
end
