# Public: Nameable class is the base component of the Person class.
#
# All methods are class methods and should be called on the nameable class.
class Nameable
  # Public: Returns NotImplementedError message of type String.
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
