List<String> getPassedStudents(Map<String, int> scores) {
  List<String> passStudent = [];
  for (var student in scores.entries) {
    if (student.value >= 50) {
      passStudent.add(student.key);
    }
  }
  return passStudent;
  // entries (to use both key and value int Map)
  // Method: .where().map().toList();
  // return scores.entries
  //     .where((student) => student.value >= 50)
  //     .map((student) => student.key)
  //     .toList();
}

void main() {
  Map<String, int> scores = {
    "Dara": 78,
    "Sokha": 45,
    "Lina": 62,
    "Vanna": 39,
    "Mony": 85,
    "Ronan": 67,
  };
  print(getPassedStudents(scores));
}
