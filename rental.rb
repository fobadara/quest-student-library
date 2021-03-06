# Public: Rental used to create a rental object.
#
# All methods are class methods and should be called on the Book class.
class Rental
  # rubocop: disable Style/ClassVars(RuboCop)
  @@rentals = []
  # rubocop: enable Style/ClassVars(RuboCop)
  attr_accessor :date, :book, :person

  # Public: Initializes a new Rental object.
  # classroom - The String name of the classroom.
  # person - The Person object of the person renting the book.
  # book - The Book object of the book being rented.
  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
  end
end
