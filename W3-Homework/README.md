# LMS layered architecture

The LMS service owns the current student, course, and result collections. Use
`LmsSystem` operations to change this state rather than changing relationships
directly.

## Business rules

- A course can be removed only when it has no enrolled students and no results.
- A student must exist and be enrolled in a course before a result can be added.
- Scores are numbers in the inclusive range 0–100.
- Multiple results for one student and course are allowed; each receives a
  service-generated ID (`R1`, `R2`, ...), which is used to remove that result.
- Discarding an enrollment also removes that student's results for that course.
- Removing a student removes their enrollments from every course and all their
  results. Other students' data is preserved.

Run the service tests with `dart test`.
