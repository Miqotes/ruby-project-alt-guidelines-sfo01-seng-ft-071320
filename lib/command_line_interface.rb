require 'tty-prompt'
# require 'colorize'
# require 'colorized_string'
prompt = TTY::Prompt.new
class CommandLineInterface
  def greet

puts'      ██████╗  █████╗ ██╗    ██╗███████╗      ██╗   ██╗██████╗ 
     ██╔══██╗██╔══██╗██║    ██║██╔════╝      ██║   ██║██╔══██╗
     ██████╔╝███████║██║ █╗ ██║███████╗█████╗██║   ██║██████╔╝
     ██╔═══╝ ██╔══██║██║███╗██║╚════██║╚════╝██║   ██║██╔═══╝ 
     ██║     ██║  ██║╚███╔███╔╝███████║      ╚██████╔╝██║     
     ╚═╝     ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝       ╚═════╝ ╚═╝
      '

    puts "Meow! Welcome to Paws-Up! Read only the finest catfood reviews here. 
    We welcome your contributions meow!"
  end

  def get_review
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
    prompt = TTY::Prompt.new
    store_name = prompt.ask('Enter store name:')
    # puts 'Enter store name:'
    # store_name = gets.chomp
    cat_name = prompt.ask('Enter user cat name:')
    brand_name = prompt.ask('Enter brand name:')
    rating_num = prompt.ask('Enter rating')
    review_text = prompt.ask('Enter your review:')
    # lc_review = CatFoodReview.create(
    # review: Faker::Coffee.unique.notes
    entered_review = CatFoodReview.create(review: review_text, rating: rating_num, brand_name: brand_name)
    cat_user = Cat.find_or_create_by(name: cat_name)
    entered_review.cat = cat_user
    store = PetFoodStore.find_or_create_by(name: store_name)
    entered_review.pet_food_store = store
    entered_review.save
    # CatFoodReview.create({ :review => review_text })
  end

  def next_choice
    prompt = TTY::Prompt.new
    if prompt.yes?('Would you like to create a review? Y/N')
      return create_review
    end

    if prompt.yes?('Would you like to read reviews? Y/N')
      return get_review
    end

    if prompt.yes?('Would you like to update a review? Y/N')
      return update_review
    end

    if prompt.yes?('Would you like to delete a review? Y/N')
      return delete_review
    end

    if prompt.yes?('Would you like to read all available reviews for every store? Y/N')
      return all_reviews
    end
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

  def all_reviews
    CatFoodReview.all.each do |review|
      puts "store name: #{review.pet_food_store.name}"
      puts "usercat: #{review.cat.name}"
      puts "brand: #{review.brand_name}"
      puts "rating: #{review.rating}"
      puts "review: #{review.review}"
      puts ''
    end
  end
end
