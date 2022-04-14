# Public: Rental used to create a rental object.
#
# All methods are class methods and should be called on the Book class.
class Rental
  attr_accessor :date

  # Public: Initializes a new Rental object.
  # classroom - The String name of the classroom.
  # person - The Person object of the person renting the book.
  # book - The Book object of the book being rented.
  def initialize(person, book, date = DateTime.now())
    @date = date
    @person = person
    @book = book
  end
end
