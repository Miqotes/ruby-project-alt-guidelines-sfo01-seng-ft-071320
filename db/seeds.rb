10.times do 
  Cat.create(name: Faker::Creature::Cat.unique.name)
end

10.times do 
  PetFoodStore.create(name: Faker::Creature::Cat.unique.registry)
end

30.times do
  lc = Cat.all.sample
  pstore = PetFoodStore.all.sample
  lc_review = CatFoodReview.create(
    review: Faker::Coffee.unique.notes,
    brand_name: Faker::Coffee.blend_name,
    rating: rand(0..10),
  )
  lc_review.cat = lc
  lc_review.pet_food_store = pstore
  lc_review.save
end
