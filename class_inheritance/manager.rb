require_relative "employee"

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    sum = 0

    self.employees.each do |emp|
      sum += emp.salary
      sum += emp.bonus(1) if emp.is_a?(Manager)
    end
    sum*multiplier
  end

end