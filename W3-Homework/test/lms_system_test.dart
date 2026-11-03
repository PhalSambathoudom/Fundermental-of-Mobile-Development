import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  group('courses', () {
    test('adds and removes a course', () {
      final lms = LmsSystem();

      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

      expect(lms.courses.single.id, 'C1');
      expect(lms.courses.single.name, 'Mobile Development');

      lms.removeCourse(courseId: 'C1');
      expect(lms.courses, isEmpty);
    });

    test('rejects duplicate IDs and removal of an unknown course', () {
      final lms = LmsSystem()..addCourse(courseId: 'C1', courseName: 'Mobile');

      expect(
        () => lms.addCourse(courseId: 'C1', courseName: 'Another course'),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.removeCourse(courseId: 'missing'),
        throwsA(isA<StateError>()),
      );
      expect(lms.courses, hasLength(1));
    });

    test('cannot remove a course with enrollments or results', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile')
        ..enrollStudent(studentId: 'S1', courseId: 'C1')
        ..addResult(studentId: 'S1', courseId: 'C1', score: 85);

      expect(
        () => lms.removeCourse(courseId: 'C1'),
        throwsA(isA<StateError>()),
      );
      expect(lms.courses, hasLength(1));
      expect(lms.results, hasLength(1));
    });
  });

  group('enrollments', () {
    test('enrolls an existing student and rejects duplicate enrollment', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile');

      lms.enrollStudent(studentId: 'S1', courseId: 'C1');

      expect(lms.courses.single.studentIds, contains('S1'));
      expect(lms.students.single.enrolledCourseIds, contains('C1'));
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
        throwsA(isA<StateError>()),
      );
      expect(lms.courses.single.studentIds, hasLength(1));
    });

    test('rejects enrollment when the student or course does not exist', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile');

      expect(
        () => lms.enrollStudent(studentId: 'missing', courseId: 'C1'),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'missing'),
        throwsA(isA<StateError>()),
      );
      expect(lms.courses.single.studentIds, isEmpty);
    });

    test('discarding an enrollment removes only its results', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addStudent(studentId: 'S2', studentName: 'Mina')
        ..addCourse(courseId: 'C1', courseName: 'Mobile')
        ..enrollStudent(studentId: 'S1', courseId: 'C1')
        ..enrollStudent(studentId: 'S2', courseId: 'C1')
        ..addResult(studentId: 'S1', courseId: 'C1', score: 85)
        ..addResult(studentId: 'S2', courseId: 'C1', score: 92);

      lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

      expect(lms.students, hasLength(2));
      expect(lms.courses.single.studentIds, ['S2']);
      expect(lms.students.first.enrolledCourseIds, isEmpty);
      expect(lms.results.map((result) => result.studentId), ['S2']);
      expect(
        () => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1'),
        throwsA(isA<StateError>()),
      );
    });

    test('rejects discard when either entity does not exist', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile');

      expect(
        () =>
            lms.discardStudentFromCourse(studentId: 'missing', courseId: 'C1'),
        throwsA(isA<StateError>()),
      );
      expect(
        () =>
            lms.discardStudentFromCourse(studentId: 'S1', courseId: 'missing'),
        throwsA(isA<StateError>()),
      );
    });
  });

  group('results', () {
    test('adds multiple identified results with valid scores', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile')
        ..enrollStudent(studentId: 'S1', courseId: 'C1');

      final first = lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 85,
      );
      final second = lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        score: 91.5,
      );

      expect(first.id, isNot(second.id));
      expect(first.score, 85);
      expect(second.score, 91.5);
      expect(lms.results, hasLength(2));
    });

    test('rejects results without existing entities or enrollment', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addStudent(studentId: 'S2', studentName: 'Mina')
        ..addCourse(courseId: 'C1', courseName: 'Mobile');

      expect(
        () => lms.addResult(studentId: 'missing', courseId: 'C1', score: 85),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'missing', score: 85),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'C1', score: 85),
        throwsA(isA<StateError>()),
      );
      expect(lms.results, isEmpty);
    });

    test('rejects scores outside 0 through 100', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addCourse(courseId: 'C1', courseName: 'Mobile')
        ..enrollStudent(studentId: 'S1', courseId: 'C1');

      for (final score in [-1, 100.1, double.infinity, double.nan]) {
        expect(
          () => lms.addResult(
            studentId: 'S1',
            courseId: 'C1',
            score: score,
          ),
          throwsA(isA<RangeError>()),
        );
      }
      expect(lms.results, isEmpty);
    });

    test('removes only the requested result', () {
      final lms = LmsSystem()
        ..addStudent(studentId: 'S1', studentName: 'Ronan')
        ..addStudent(studentId: 'S2', studentName: 'Mina')
        ..addCourse(courseId: 'C1', courseName: 'Mobile')
        ..enrollStudent(studentId: 'S1', courseId: 'C1')
        ..enrollStudent(studentId: 'S2', courseId: 'C1');
      final removed = lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      final retained =
          lms.addResult(studentId: 'S2', courseId: 'C1', score: 92);

      lms.removeResult(resultId: removed.id);

      expect(lms.results, [retained]);
      expect(lms.students, hasLength(2));
      expect(lms.courses.single.studentIds, ['S1', 'S2']);
      expect(
        () => lms.removeResult(resultId: removed.id),
        throwsA(isA<StateError>()),
      );
      expect(
        () => lms.removeResult(resultId: 'missing'),
        throwsA(isA<StateError>()),
      );
    });
  });

  test('removing a student clears all enrollments and results', () {
    final lms = LmsSystem()
      ..addStudent(studentId: 'S1', studentName: 'Ronan')
      ..addStudent(studentId: 'S2', studentName: 'Mina')
      ..addCourse(courseId: 'C1', courseName: 'Mobile')
      ..addCourse(courseId: 'C2', courseName: 'Databases')
      ..enrollStudent(studentId: 'S1', courseId: 'C1')
      ..enrollStudent(studentId: 'S1', courseId: 'C2')
      ..enrollStudent(studentId: 'S2', courseId: 'C1')
      ..addResult(studentId: 'S1', courseId: 'C1', score: 85)
      ..addResult(studentId: 'S1', courseId: 'C2', score: 87)
      ..addResult(studentId: 'S2', courseId: 'C1', score: 92);

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.map((student) => student.id), ['S2']);
    expect(lms.courses[0].studentIds, ['S2']);
    expect(lms.courses[1].studentIds, isEmpty);
    expect(lms.results.map((result) => result.studentId), ['S2']);
  });

  test('rejects duplicate student IDs and removal of unknown students', () {
    final lms = LmsSystem()..addStudent(studentId: 'S1', studentName: 'Ronan');

    expect(
      () => lms.addStudent(studentId: 'S1', studentName: 'Another name'),
      throwsA(isA<StateError>()),
    );
    expect(
      () => lms.removeStudent(studentId: 'missing'),
      throwsA(isA<StateError>()),
    );
    expect(lms.students, hasLength(1));
  });
}
