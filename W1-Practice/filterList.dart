void main() {
  List<int> passes = [45, 78, 62, 49, 85, 33, 90, 50];

  var result = passes.where((passes) => passes >= 50);
  print(result);
}

  // List<int> newPasses = [];

  // for (int i = 0; i < passes.length; i++) {
  //   if (passes[i] >= 50) {
  //     newPasses.add(passes[i]);
  //   }
  // }
  // print(newPasses);