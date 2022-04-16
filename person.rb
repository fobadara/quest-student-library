require_relative './nameable'
# Public: Person class used for creating various person objects and
#  it is a concrete component that inherits from Nameable class.
#
# All methods are class methods and should be called on the Person class.
#
# Examples
#
# person = Person.new(22, 'maximilianus' parent_permission: true)
# person.can_use_services?
# # => true
class Person < Nameable
  # Public: Gets/Sets the String name and Interger age of the user.
  attr_accessor :name, :age, :rentals
  # Public: Returns the Integer id of the user.
  attr_reader :id

  # Public: Initialize a new Person object.
  #
  # id   - The Integer id of the person.
  # name - The String name of the person.
  # age  - The Integer age of the person.
  # parent_permission - The Boolean permission of the person.
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @id = rand(1..100)
    @parent_permission = parent_permission
    @rental = []
  end

  # Internal: Check if the person is of age.
  #
  # Returns true if the person is of age, false otherwise.
  def of_age?
    @age >= 18
  end

  private :of_age?

  # Public: Check if the person can use the service.
  #
  # Returns true if the person can use the service, false otherwise.
  def can_use_services?
    @parent_permission || is_of_age?
  end

  # Public: Returns the String name of the person.
  def correct_name
    name
  end

  # Public: add details of new rental
  def add_rental(rental)
    @rentals.push(rental)
  end
end

# Public: Decorator class is the base decorator used to wrap
#   the CapitalizeDecorator and TrimmerDecorator.
class Decorator < Nameable
  attr_accessor :nameable

  # Public: Initialize a new Decorator object.
  #
  # nameable - The Nameable object.
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # Public: Returns the String name of the person.
  def correct_name
    @nameable.correct_name
  end
end
