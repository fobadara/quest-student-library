require './main'
# Public Teacher class used for creating teacher objects
#  Teacher class inherits from person class.
#
# All methods are class methods and should be called on the Person class.
#
# Examples
#
# teacher = Teacher.new('unknown')
# teacher.can_use_services?
# # => true
class Teacher < Person
  attr_reader :specialization

  # Public: Initializes a new Teacher object.
  # specialization - The String name of the specialization.
  def initialize(specialization)
    super
    @specialization = specialization
  end

  # Public: Returns true.
  def can_use_services?
    true
  end
end
