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
    entered_review = CatFoodReview.create(review: review_text)
  end
end
