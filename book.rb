# Public: Book class used to create book object
#
# All methods are class methods and should be called on the Book class.
class Book
  attr_reader :rental

  # Public: Initializes a new Book object.
  # title - The String title of the book.
  # author - The string author of the book.
  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  # Public: add details of new rental
  def add_rental(rental)
    @rentals << rental
  end
end
