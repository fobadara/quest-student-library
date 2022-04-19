require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'

# Public: Class used to call other create class methods.
class Creator
  # Public: checks the right class to be called.
  #
  # input - The String name of the class to call.
  def self.create(option)
    case option
    when 'Person'
      PersonCreator.create
    when 'Book'
      BookCreator.create
    when 'Rental'
      RentalCreator.create
    else
      puts 'Nothing to create'
    end
  end
end

# rubocop: disable Metrics/MethodLength
# rubocop: disable Migration/CyclomaticComplexity
# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/PerceivedComplexity

# Public: Class used to check for person type.
#
# All methods are class methods and should be called on the PersonCreator class.
#
# Examples
#
# PersonCreator.create
class PersonCreator
  # Public: Initializes a new Student object.
  

  # Public: Initializes a new Teacher object.
  def self.create_a_teacher
    print 'Enter the teacher\'s name: '
    name = gets.chomp

    print 'Enter the teacher\'s age: '
    age = gets.chomp.to_i

    print 'specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    Person.class_variable_get(:@@people).push(teacher)
    puts 'Teacher created!'
    sleep 2
  end

  # Public: checks the person object to be created.
  def self.create
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
end

# Public: Class used to receive details for new book.
class BookCreator
  # Public: Initializes a new Book object.
  def self.create
    puts `clear`
    puts 'Book Creation'
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    Book.class_variable_get(:@@book).push(book)

    puts "#{book.title} added successfully!"
    sleep 2
  end
end

# Public: Class used to receive details for new rental.
#
# All methods are class methods and should be called on the RentalCreator class.
#
# Examples
#
# RentalCreator.create
class RentalCreator
  # Public: Initializes a new Rental object.
  def self.create
    @book = Book.class_variable_get(:@@book)
    @people = Person.class_variable_get(:@@people)
    @rentals = Rental.class_variable_get(:@@rentals)

    if @book.empty?
      puts 'No book has been created! Please create a book first.'
    elsif @people.empty?
      puts 'No person has been created! Please create a person first.'
    else
      puts 'Select a book from the following list by number'
      @book.each_with_index do |book, index|
        puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
      end
      book_index = gets.chomp.to_i

      if book_index > @book.length
        puts 'Invalid input! Please enter a number between 1 and the number of books.'
        sleep 2
        create_rental
      end

      puts 'Select a person from the following list by index number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.class}] Name: #{person.name}, id: #{person.id} Age: #{person.age}"
      end
      person_index = gets.chomp.to_i

      if person_index > @people.length
        puts 'Invalid input! Please enter a number between 1 and the number of people.'
        sleep 2
        create_rental
      end

      print 'Date: '
      date = gets.chomp
      date = date.empty? ? DateTime.now : date
      rental = Rental.new(@people[person_index - 1], @book[book_index - 1], date)
      @rentals.push(rental)

      puts 'Rental created successfully!'
    end
    sleep 2
  end
end

# rubocop: enable Metrics/MethodLength
# rubocop: enable Migration/CyclomaticComplexity
# rubocop: enable Metrics/AbcSize
# rubocop: enable Metrics/PerceivedComplexity
