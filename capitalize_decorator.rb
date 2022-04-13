require './person'
# Public: CapitalizeDecorator class is a concrete decorator
#   used to capitalize the name of the person.
#
# All methods are class methods and should be called on the CapitalizeDecorator class.
#
# Examples
# person = Person.new(22, 'maximilianus')
# capitalizedPerson = CapitalizeDecorator.new(person_object)
# capitalizedPerson.correct_name
# # => "MAXIMILIANUS"
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end
