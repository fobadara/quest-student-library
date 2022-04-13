require './person'
# Public: TrimmerDecorator class is a concrete decorator
#  used to trim the name of the person.
#
# All methods are class methods and should be called on the TrimmerDecorator class.
#
# Examples
#
# person = Person.new(22, 'maximilianus')
# trimmedPerson = TrimmerDecorator.new(person_object)
# trimmedPerson.correct_name
# # => "Maximilian"
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end
