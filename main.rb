require './assignment'
require './io'

# Initialize Class
klass = ClassData.new('5')

# Define Ranges for Grading
# Optionally take input from console and dynamically update Grade Range
r1 = Range.new(340 , 10000)
r2 = Range.new(300 , 340 , exclude_end=true)
r3 = Range.new(0 , 300 , exclude_end=true)
grades = {}
grades["A"] = r1
grades["B"] = r2
grades["C"] = r3

# Get Grading Sceheme Helper Instance
grade_calculator = GradeCalculator.new(grades)

# Starting Reading Input
InputReaderWriter.read_input(klass , grade_calculator)

#Print Output to console
InputReaderWriter.print_scorecard(klass)
