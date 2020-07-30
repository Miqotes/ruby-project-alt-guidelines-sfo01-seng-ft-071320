class CommandLineInterface

  def greet
    puts "Meow! Welcome to Cattiviews! Read only the finest catfood reviews here. 
    We welcome your contributions meow!"
  end

  def enter_store_name
    #Chonk should be able to read reviews of the catfood store he is going to.

    puts 'Is your food getting stale and boring? Why not read reviews for your catfood destination? What store are you heading to today?'

    store_name = gets.chomp
    store = PetFoodStore.find_by(name: store_name)
    if store.nil?
      puts 'No results.'
      return
    end
    store.cat_food_reviews.each do |review|
      puts "usercat: #{review.cat.name}"
      puts "brand: #{review.brand_name}"
      puts "rating: #{review.rating}"
      puts "review: #{review.review}"
      puts ''
    end
  end

  def create_review
    puts 'Enter store name:'
    store_name = gets.chomp
    puts 'Enter user cat name:'
    cat_name = gets.chomp
    puts 'Enter brand name:'
    brand_name = gets.chomp
    puts 'Enter rating:'
    rating_num = gets.chomp.to_i
    puts 'Enter your review:'
    review_text = gets.chomp 
    
    #lc_review = CatFoodReview.create(
    #review: Faker::Coffee.unique.notes
    entered_review = CatFoodReview.create(review: review_text, rating: rating_num, brand_name: brand_name)
    cat_user = Cat.find_or_create_by(name: cat_name)
    entered_review.cat = cat_user
    store = PetFoodStore.find_or_create_by(name: store_name)
    entered_review.pet_food_store = store
    entered_review.save
    # CatFoodReview.create({ :review => review_text })
  end

  def update_review
    puts 'Enter user cat name:'
    cat_name = gets.chomp
    cat_user = Cat.find_by(name: cat_name)
    reviews = cat_user.cat_food_reviews
    puts 'Enter review number to change:'
    update_review = gets.chomp.to_i
    review = reviews[update_review - 1]
    puts 'Enter your new review:'
    review_text = gets.chomp
    review.review = review_text
    review.save
    # collect review number from user
    # edit review.review at number
    # save changes to database
  end
  
  def delete_review
    puts 'Enter user cat name:'
    cat_name = gets.chomp
    cat_user = Cat.find_by(name: cat_name)
    reviews = cat_user.cat_food_reviews
    puts 'Enter review number to delete:'
    delete_review = gets.chomp.to_i
    review = reviews[delete_review - 1]
    review.destroy
  end
  
end
