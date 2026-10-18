class Course_Result {
  final String id;
  final String studentId;
  final String courseId;
  final int score;

  Course_Result(
      {required this.id,
      required this.studentId,
      required this.courseId,
      required this.score});
}

typedef CourseResult = Course_Result;
