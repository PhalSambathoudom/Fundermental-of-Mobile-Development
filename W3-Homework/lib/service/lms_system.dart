import '../model/course.dart';
import '../model/course_result.dart';
import '../model/student.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  int _nextResultId = 1;

  void addStudent({required String studentId, required String studentName}) {
    if (_findStudentOrNull(studentId) != null) {
      throw StateError('Student $studentId already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    if (_findStudentOrNull(studentId) == null) {
      throw StateError('Student $studentId not found');
    }

    students.removeWhere((student) => student.id == studentId);
    for (final course in courses) {
      course.studentIds.remove(studentId);
    }
    results.removeWhere((result) => result.studentId == studentId);
  }

  void addCourse({required String courseId, required String courseName}) {
    if (_findCourseOrNull(courseId) != null) {
      throw StateError('Course $courseId already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw StateError('Course $courseId not found');
    }
    if (course.studentIds.isNotEmpty || results.any((result) => result.courseId == courseId)) {
      throw StateError('Course $courseId still has enrollments or results');
    }

    courses.remove(course);
  }

  void enrollStudent({ required String studentId, required String courseId }) {
    final student = _findStudentOrNull(studentId);

    if (student == null) {
      throw StateError('Student $studentId not found');
    }

    final course = _findCourseOrNull(courseId);
    
    if (course == null) {
      throw StateError('Course $courseId not found');
    }
    if (course.studentIds.contains(studentId)) {
      throw StateError('Student $studentId is already enrolled in $courseId');
    }

    course.studentIds.add(studentId);
    student.enrolledCourseIds.add(courseId);
  }

  void discardStudentFromCourse({
    required String studentId,
    required String courseId,
  }) {
    final student = _findStudentOrNull(studentId);
    if (student == null) {
      throw StateError('Student $studentId not found');
    }
    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw StateError('Course $courseId not found');
    }
    if (!course.studentIds.contains(studentId)) {
      throw StateError('Student $studentId is not enrolled in $courseId');
    }

    course.studentIds.remove(studentId);
    student.enrolledCourseIds.remove(courseId);
    results.removeWhere(
      (result) => result.studentId == studentId && result.courseId == courseId,
    );
  }

  CourseResult addResult({
    required String studentId,
    required String courseId,
    required num score,
  }) {
    if (!score.isFinite || score < 0 || score > 100) {
      throw RangeError.range(score, 0, 100, 'score');
    }
    if (_findStudentOrNull(studentId) == null) {
      throw StateError('Student $studentId not found');
    }
    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw StateError('Course $courseId not found');
    }
    if (!course.studentIds.contains(studentId)) {
      throw StateError('Student $studentId is not enrolled in $courseId');
    }

    final result = CourseResult(
      id: 'R${_nextResultId++}',
      studentId: studentId,
      courseId: courseId,
      score: score,
    );
    results.add(result);
    return result;
  }

  void removeResult({required String resultId}) {
    final resultIndex = results.indexWhere((result) => result.id == resultId);
    if (resultIndex == -1) {
      throw StateError('Result $resultId not found');
    }

    results.removeAt(resultIndex);
  }

  Student? _findStudentOrNull(String studentId) {
    for (final student in students) {
      if (student.id == studentId) {
        return student;
      }
    }
    return null;
  }

  Course? _findCourseOrNull(String courseId) {
    for (final course in courses) {
      if (course.id == courseId) {
        return course;
      }
    }
    return null;
  }
}
