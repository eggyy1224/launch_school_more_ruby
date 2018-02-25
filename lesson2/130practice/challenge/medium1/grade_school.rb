class School
  attr_accessor :students
  def initialize
    @students = {}
  end

  def add(name, grade)
    students[grade] ? students[grade] << name : students[grade] = [name]
  end

  def to_h
    students.each { |k, v| students[k] = v.sort }
    students.sort_by { |k, v| k }.to_h
  end

  def grade(n)
    students[n] ? students[n] : []
  end
end