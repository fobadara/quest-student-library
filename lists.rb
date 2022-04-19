require_relative './book'
require_relative './rental'
require_relative './person'

# Public: Class used to call other listing class methods.
#
# All methods are class methods and should be called on the Listing class.
# Examples
#
# listing.list('Book')
class Listing
  # Public: checks the right class to be called.
  #
  # input - The String name of the class to list.
  def self.list(input)
    case input
    when 'Book'
      BookListing.list
    when 'People'
      PeopleListing.list
    when 'Rentals'
      RentalsListing.list
    else
      puts 'Nothing to list'
    end
  end
end

# Public: Class used to list all books.
#
# All methods are class methods and should be called on the BookListing class.
#
# Examples
#
# BookListing.list
class BookListing
  # Public: Lists all the books in the library.
  #
  # @books - The Array of Book objects.
  def self.list
    @book = Book.class_variable_get(:@@book)
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n"
    puts 'There are no books in the library. Please add some books.' if @book.empty?
    @book.each do |book|
      puts "#{book.title} by #{book.author}"
    end
    puts 'Press any key to go back to the main menu....'
    gets.chomp
  end
end

# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/AbcSize

# Public: Class used to list all people.
#
# All methods are class methods and should be called on the PeopleListing class.
#
# Examples
#
# PeopleListing.list
class PeopleListing
  # Public: Lists all the people in the library.
  #
  # @people - The Array of Person objects.
  def self.list
    @people = Person.class_variable_get(:@@people)
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE PEOPLE \n\n\n"
    puts 'There are no people in the library. Please add some people.' if @people.empty?
    @people.each do |person|
      case person.class.to_s
      when 'Student'
        puts "[#{person.class}]  Name: #{person.name}   ID: #{person.id}  Age:#{person.age}"
      when 'Teacher'
        puts "[#{person.class}]  Name:   #{person.name}   ID: #{person.id}  Age:#{person.age}"
      else
        puts '[Person]'
      end
    end
    puts 'Press any key to go back to the main menu....'
    gets.chomp
  end
end

# Public: Class used to list rentals.
#
# All methods are class methods and should be called on the RentalsListing class.
#
# Examples
#
# RentalsListing.list
class RentalsListing
  # Public: Lists all the rentals in the library.
  #
  # @rentals - The Array of Rental objects.
  def self.list
    @rentals = Rental.class_variable_get(:@@rentals)
    puts 'ID of the person: '
    person_index = gets.chomp.to_i

    if @rentals.empty?
      puts 'There are no rentals for this person'
    else
      @rentals.each do |rental|
        if rental.person.id == person_index
          puts "#{rental.book.title} rented by #{rental.person.name} on #{rental.date}"
        else
          puts 'There are no rentals for this person'
        end
      end
    end
    puts 'Press any key to go back to the main menu....'
    gets.chomp
  end
end

# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/AbcSize
