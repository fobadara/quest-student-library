# Public: Person class used for creating various person objects.
#
# All methods are class methods and should be called on the Person class.
#
# Examples
#
# person = Person.new(9, 'John Doe', parent_permission: true)
# person.can_use_services?
# # => true
class Person
  # Public: Gets/Sets the String name and Interger age of the user.
  attr_accessor :name, :age
  # Public: Returns the Integer id of the user.
  attr_reader :id

  # Public: Initialize a new Person object.
  #
  # id   - The Integer id of the person.
  # name - The String name of the person.
  # age  - The Integer age of the person.
  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @id = rand(1..100)
    @parent_permission = parent_permission
  end

  # Internal: Check if the person is of age.
  #
  # Returns true if the person is of age, false otherwise.
  def of_age?
    @age >= 18
  end

  private :is_of_age?

  # Public: Check if the person can use the service.
  #
  # Returns true if the person can use the service, false otherwise.
  def can_use_services?
    @parent_permission || is_of_age?
  end
end
