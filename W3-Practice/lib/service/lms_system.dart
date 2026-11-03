import 'package:lms_layered_architecture_example/model/assignment.dart';

import '../model/student.dart';
import '../model/course.dart';
import '../model/course_result.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<Course_Result> results = [];
  final List<Assignment> assignments = [];

  void addStudent({required String studentId, required String studentName}) {
    final student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $studentId already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    final student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    students.removeWhere((s) => s.id == studentId);

    for (final course in courses) {
      course.studentIds.remove(studentId);
    }

    results.removeWhere((result) => result.studentId == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (final s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  // Course Creation and Removal
  void addCourse({required String courseId, required String courseName}) {
    if (_findCourseOrNull(courseId) != null) {
      throw Exception('Course $courseId is already existed!');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId is not exist!');
    }

    courses.removeWhere((c) => c.id == courseId);
    results.removeWhere((result) => result.courseId == courseId);
    assignments.removeWhere((assignment) => assignment.courseId == courseId);
  }

  Course? _findCourseOrNull(String courseId) {
    for (final c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  void enrollStudent({required String studentId, required String courseId}) {
    final student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId is not exist!');
    }

    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId is not exist!');
    }

    if (course.studentIds.contains(studentId)) {
      throw Exception(
          'Student $studentId is already enrolled in course $courseId');
    }

    course.studentIds.add(studentId);
  }

  void discardStudentFromCourse(
      {required String studentId, required String courseId}) {
    final student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId is not exist!');
    }

    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId is not exist!');
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is not enrolled in course $courseId');
    }

    course.studentIds.remove(studentId);

    results.removeWhere((result) =>
        result.studentId == studentId && result.courseId == courseId);
  }

  void addResult(
      {required String studentId,
      required String courseId,
      required int score,
      String? resultId}) {
    final student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId does not exist!');
    }

    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId does not exist!');
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is not enrolled in course $courseId');
    }

    if (score < 0 || score > 100) {
      throw Exception('Score must be between 0 to 100!');
    }

    if (results.any((results) =>
        results.studentId == studentId && results.courseId == courseId)) {
      throw Exception(
          'Result already exists for student $studentId in course $courseId');
    }

    results.add(Course_Result(
        id: resultId ?? 'R${results.length + 1}',
        studentId: studentId,
        courseId: courseId,
        score: score));
  }

  void removeResult({required String resultId}) {
    final existing = _findResultOrNull(resultId);
    if (existing == null) {
      throw Exception('Result $resultId not found!');
    }

    results.removeWhere((result) => result.id == resultId);
  }

  void addAssignment(
      {required String courseId,
      required String assignmentId,
      required String title}) {
    final course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId does not exist');
    }

    if (assignments.any((assignment) => assignment.id == assignmentId)) {
      throw Exception('Assignment $assignmentId already exists');
    }

    assignments
        .add(Assignment(id: assignmentId, courseId: courseId, title: title));
  }

  void updateAssignmentStage(
      {required String assignmentId, required AssignmentStage stage}) {
    final assignment = assignments.firstWhere(
      (element) => element.id == assignmentId,
      orElse: () => throw Exception('Assignment $assignmentId not found'),
    );
    assignment.stage = stage;
  }

  Course_Result? _findResultOrNull(String resultId) {
    for (final result in results) {
      if (result.id == resultId) {
        return result;
      }
    }
    return null;
  }
}
