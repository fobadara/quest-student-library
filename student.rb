require_relative './person'

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
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # Public: Creates a String.
  #
  # Returns a string.
  def play_hooky
    '¯\(ツ)/¯'
  end
end
