class CreatePetFoodStores < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_food_stores do |t|
      t.string :name
    end
  end
end
