# ClassData is having information about a class properties like students ,
# subjects , number of students , average of class
class ClassData
  attr_accessor :students , :number , :average , :subjects

  def initialize(number)
    @number = number
    @students = Array.new
    @average = 0;
    @subjects = Array.new;
  end

  # Help Find Subject that is already instantiated
  def find_subject(name)
    self.subjects.each { |subject|
                            if subject.name == name
                              return subject
                            end
                       }
    return nil
  end

  # Get count of all students with given grade
  def find_all_students_with_grade(grade)
    count = 0;
    self.students.each { |student|
                            if student.grade == grade
                              count = count+1
                            end
                       }
    return count;
  end

end

# Student Class has all properties of students like subjects ,
# total , grade , marks

class Student
  attr_accessor :subject_mark_mapping , :number , :total , :grade , :klass

  def initialize(number)
    @number = number
    @klass = nil
    @total = 0
    @subject_mark_mapping = Array.new
    @grade = "NA"
  end

  # Get Marks in given subject
  def get_marks_in_subject(subject)
    self.subject_mark_mapping.each { |subjectMarkMap|
      if subjectMarkMap.subject && subjectMarkMap.subject.name == subject
        return subjectMarkMap.marks
      end
    }
    return 0;
  end
end

# Subject class is having all information about subject like name , students enrolled
class Subject
  attr_accessor :name , :klass

  def initialize(name)
    @name = name
    @klass = nil
  end
end

# Mapping between subjects and marks for a students
class SubjectMarkMapping
  attr_accessor :subject , :marks
  def initialize(subject , marks)
    @subject = subject
    @marks = marks
  end
end

# GradeCalculator for producing different grading scehems
class GradeCalculator
  attr_accessor :grades

  def initialize(grades)
    @grades = grades
  end

  #Check for Grade for given marks
  def get_student_grade(number)
    self.grades.each do |key, range|
      if range.include?(number)
        return key
      end
    end
    return "NA"
  end

end
