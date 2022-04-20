require 'date'

require_relative './create'
require_relative './lists'

# Public: App class used to run main logic.
#
class App
  # Public: Main method used to run the app.
  def run
    puts 'Loading App...'
    sleep 0.8
    menu
  end

  # rubocop: disable Metrics/MethodLength(RuboCop)
  # rubocop: disable CyclomaticComplexity(RuboCop)

  # Public: used to navigate through the app.
  def menu
    puts `clear`
    puts "Welcome to Quest Student Library!\n\n"
    puts 'What would you like to do?'
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'

    input = gets.chomp.to_i

    validate_input input
  end

  def validate_input(input)
    case input
    when 1
      Listing.list('Book')
      menu
    when 2
      Listing.list('People')
      menu
    when 3
      Creator.create('Person')
      menu
    when 4
      Creator.create('Book')
      menu
    when 5
      Creator.create('Rental')
      menu
    when 6
      Listing.list('Rentals')
      menu
    when 7
      puts `clear`
      puts 'Thank you for using Quest Student Library. See you next time!'
      sleep 1.5
      exit
    else
      puts `clear`
      puts 'Invalid input! Please enter a number between 1 and 7.'
      sleep 1
      menu
    end
  end
end

# rubocop: enable Metrics/MethodLength(RuboCop)
# rubocop: enable CyclomaticComplexity(RuboCop)
