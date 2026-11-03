import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  group('LMS system', () {
    test('creates and removes a student', () {
      final lms = LmsSystem();

      lms.addStudent(studentId: 'S1', studentName: 'ronan');
      expect(lms.students.first.name, 'ronan');

      lms.removeStudent(studentId: 'S1');
      expect(lms.students, isEmpty);
    });

    test('adds and removes a course', () {
      final lms = LmsSystem();

      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      expect(lms.courses.first.name, 'Mobile Development');

      expect(() => lms.addCourse(courseId: 'C1', courseName: 'Another'),
          throwsException);
      expect(() => lms.removeCourse(courseId: 'C1'), returnsNormally);
    });

    test('enrolls a student in a course and records a result', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Akun');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      expect(lms.courses.first.studentIds, contains('S1'));

      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      expect(lms.results.first.score, 85);
      expect(lms.results.first.studentId, 'S1');
    });

    test('removing a student preserves the other student and course data', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Akun');
      lms.addStudent(studentId: 'S2', studentName: 'Bun');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.addAssignment(
        courseId: 'C1',
        assignmentId: 'A1',
        title: 'Architecture practice',
      );
      lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 90,
        resultId: 'R1',
      );
      lms.addResult(
        studentId: 'S2',
        courseId: 'C1',
        score: 88,
        resultId: 'R2',
      );

      lms.removeStudent(studentId: 'S1');

      expect(lms.students.map((student) => student.id), ['S2']);
      expect(lms.courses.single.studentIds, ['S2']);
      expect(lms.results, hasLength(1));
      expect(lms.results.single.id, 'R2');
      expect(lms.results.single.studentId, 'S2');
      expect(lms.results.single.courseId, 'C1');
      expect(lms.results.single.score, 88);
      expect(lms.assignments, hasLength(1));
      expect(lms.assignments.single.id, 'A1');
      expect(lms.assignments.single.courseId, 'C1');
    });

    test('removes a result and rejects invalid data', () {
      final lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'Akun');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 80, resultId: 'R1');

      lms.removeResult(resultId: 'R1');
      expect(lms.results, isEmpty);

      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'C1', score: 120),
        throwsException,
      );
      expect(
        () => lms.addResult(studentId: 'S99', courseId: 'C1', score: 80),
        throwsException,
      );
    });
  });
}
