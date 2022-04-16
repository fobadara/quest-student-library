require 'date'

require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

# rubocop: disable Metrics/ClassLength
# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/AbcSize(RuboCop)

# Public: App class used to run main logic.
#
# All methods are class methods and should be called on the App class.
#
# Examples
#
# app = App.new
# app.run
class App
  # Puclic: Initialize  App class
  #
  # Returns: App Object
  def initialize
    @book = []
    @person = []
    @rental = []
  end

  # Public: Main method used to run the app.
  def run
    puts 'Loading App...'
    sleep 0.8
    menu
  end

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
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_by_person_id
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

  def create_a_person
    print 'Do you want to create a student (1) or teacher (2)? [Input the number]: '
    input = gets.chomp.to_i

    case input
    when 1
      create_a_student
    when 2
      create_a_teacher
    else
      puts 'Invalid input! Kindly enter a number between 1 and 2.'
    end
  end

  def list_all_books
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n"
    puts 'There are no books in the library. Please add some books.' if @book.empty?
    @book.each do |book|
      puts "#{book.title} by #{book.author}"
    end
    puts 'Press any key to go back to the main menu....'
    gets.chomp
    menu
  end

  def list_all_people
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE PEOPLE \n\n\n"
    puts 'There are no people in the library. Please add some people.' if @person.empty?
    @person.each do |person|
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
    menu
  end

  def create_a_student
    print 'Enter the student\'s age: '
    age = gets.chomp.to_i

    print 'Enter the student\'s name: '
    name = gets.chomp

    parent_permission = false
    print 'Has parent permission? [Y/N]: '
    input = gets.chomp.downcase
    parent_permission = true if input == 'y'

    student = Student.new(age, @class, name, parent_permission)
    @person << student
    puts 'Student created!'
    sleep 1
    menu
  end

  def create_a_teacher
    print 'Enter the teacher\'s age: '
    age = gets.chomp.to_i

    print 'Enter the teacher\'s name: '
    name = gets.chomp

    print 'specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @person << teacher
    puts 'Teacher created!'
    sleep 1
    menu
  end

  def create_book
    puts `clear`
    puts 'Book Creation'
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book << book

    puts "#{book.title} added successfully!"
    sleep 1
    menu
  end

  def create_rental
    if @book.empty?
      puts 'No book has been created! Please create a book first.'
      sleep 2
      menu
    end
    puts 'Select a book from the following list by number'
    @book.each_with_index do |book, index|
      puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    if book_index > @book.length
      puts 'Invalid input! Please enter a number between 1 and the number of books.'
      sleep 1
      create_rental
    end

    if @person.empty?
      puts 'No person has been created! Please create a person first.'
      sleep 2
      menu
    end

    puts 'Select a person from the following list by index number (not id)'
    @person.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Name: #{person.name}, id: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    if person_index > @person.length
      puts 'Invalid input! Please enter a number between 1 and the number of people.'
      sleep 1
      create_rental
    end

    print 'Date: '
    date = gets.chomp
    date = date.empty? ? DateTime.now : date
    rental = Rental.new(@person[person_index - 1], @book[book_index - 1], date)
    @rental << rental

    puts 'Rental created successfully!'
    sleep 1
    menu
  end

  def list_rentals_by_person_id
    puts 'ID of the person: '
    person_index = gets.chomp.to_i

    if @rental.empty?
      puts 'There are no rentals for this person'
    else
      @rental.each do |rental|
        if rental.person.id == person_index
          puts "#{rental.book.title} rented by #{rental.person.name} on #{rental.date}"
        else
          puts 'There are no rentals for this person'
        end
      end
    end
    puts 'Press any key to go back to the main menu....'
    gets.chomp
    menu
  end
end

# rubocop: enable Metrics/ClassLength
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/AbcSize(RuboCop)
