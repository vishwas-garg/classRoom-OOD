# Input & Output class to help read and process and write outputs to console
class InputReaderWriter

  # Parse Input , Instantiate all objects <Student , Subjects , SubjectMarkMapping>
  def self.parse_input(klass,query_str,grade_calculator)
      student_number = query_str.shift
      if student_number.length == 1
        student_number = "0"+student_number
      end
      student = Student.new(student_number)
      klass.students.push(student)
      student.klass = klass
      query_str.each { |data|
                          subjects_marks = data.split("-")
                          subject = klass.find_subject(subjects_marks[0])
                          if !subject
                            subject = Subject.new(subjects_marks[0])
                            klass.subjects.push(subject)
                            subject.klass = klass
                          end
                          subject_mark_map = SubjectMarkMapping.new(subject , subjects_marks[1].to_i)
                          student.subject_mark_mapping.push(subject_mark_map)
                          student.total = student.total + subjects_marks[1].to_i
                     }
      student.grade = grade_calculator.get_student_grade(student.total)
      number_of_students = klass.students.length
      average_before = klass.average
      current_average = ((average_before*(number_of_students-1))+student.total)/number_of_students
      klass.average = current_average
  end

  # Print output to console in the asked format
  def self.print_scorecard(klass)
      students = klass.students;
      p "Score Board"
      p "ID subject1 subject2 subject3 subject4 Grand-Total Grade Average-Compare"
      below_average = 0
      above_average = 0
      students.each { |student|
          status = ""
          if student.total > klass.average
            status  = "ABOVE"
            above_average = above_average+1
          else
            status = "BELOW"
            below_average = below_average+1
          end
          p "| #{student.number} | #{student.get_marks_in_subject("S1")} | #{student.get_marks_in_subject("S2")} | #{student.get_marks_in_subject("S3")} | #{student.get_marks_in_subject("S4")} | #{student.total} | #{student.grade} | #{status} |"
      }
      p "Grade Report"
      p "Number of students in A Grade :: #{klass.find_all_students_with_grade("A")}"
      p "Number of students in B Grade :: #{klass.find_all_students_with_grade("B")}"
      p "Number of students in C Grade :: #{klass.find_all_students_with_grade("C")}"
      p "Number of students above their grade average :: #{above_average}"
      p "Number of students below their grade average :: #{below_average}"
  end

  # Read from console line by line and send for parsing
  def self.read_input(klass , grade_calculator)
    student_info = gets.chomp
    while !student_info.empty?
      student_info = student_info.split(",")
      self.parse_input(klass , student_info , grade_calculator);
      student_info = gets.chomp
    end
  end

end
