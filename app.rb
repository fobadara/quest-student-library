class App
  
end

# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
#   List all books.
#   List all people.
#   Create a person (teacher or student, not a plain Person).
#   Create a book.
#   Create a rental.
#   List all rentals for a given person id.
#   In your main.rb define the entry point, this will be a method called main that is invoked at the end of your file. This method should do the following:
#   Present the user with a list of options to perform.
#   Lets users choose an option.
#   If needed, ask for parameters for the option.
#   Have a way to quit the app.
class App
  def initialize
    @book_repo = BookRepository.new
    @person_repo = PersonRepository.new
    @rental_repo = RentalRepository.new
  end

  def main
    puts "Welcome to the library!"
    puts "What would you like to do?"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person id"
    puts "7. Quit"
    input = gets.chomp.to_i
    case input
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts "Goodbye!"
    else
      puts "Invalid input"
    end
  end

  def list_books
    @book_repo.all.each do |book|
      puts book.title
    end
  end

  def list_people
    @person_repo.all.each do |person|
      puts person.name
    end
  end

  def create_person
    puts "What is the name of the person?"
    name = gets.chomp
    puts "What is the age of the person?"
    age = gets.chomp.to_i
    puts "What is the