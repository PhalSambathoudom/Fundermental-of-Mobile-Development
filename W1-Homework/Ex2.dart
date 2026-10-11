double computeAverage(List<int> scores) {
  int sum = 0;
  for (int score in scores) {
    sum += score;
  }
  return sum / scores.length;
}

void main() {
  final students = [
    {"name": "Dara", "Dart": 70, "Flutter": 80, "Database": 60},
    {"name": "Sokha", "Dart": 50, "Flutter": 90, "Database": 70},
    {"name": "Lina", "Dart": 80, "Flutter": 70, "Database": 90},
  ];
  final courses = ["Dart", "Flutter", "Database"];

  // Implement computeAverage()
  // For each course:

  for (String course in courses) {
    // 1. Create a list of scores
    List<int> scores = [];
    for (var student in students) {
      scores.add(student[course] as int);
    }
    // 2. Compute the average
    final double avg = computeAverage(scores);
    // 3. Display the course name and average
    print("$course: ${avg.toStringAsFixed(2)}");
  }
}
