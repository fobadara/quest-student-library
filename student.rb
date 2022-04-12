require './main'

# Public: Student class used for creating student objects
#   Student class inherits from person class.
#
# All methods are class methods and should be called on the Person class.
#
# Examples
#
# student = Student.new('unknown')
# student.play_hooky
# # => '¯\(ツ)/¯'
class Student < Person
  # Public: Initializes a new Student object.
  # classroom - The String name of the classroom.
  def initialize(classroom)
    super
    @classroom = classroom
  end

  # Public: Creates a String.
  #
  # Returns a string.
  def play_hooky
    '¯\(ツ)/¯'
  end
end

student = Student.new('unknown')
puts student.play_hooky
