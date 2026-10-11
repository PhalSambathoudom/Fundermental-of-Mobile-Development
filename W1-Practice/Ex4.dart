void main() {
  String firstName = 'Ronan';
  String lastName = 'Ogor';
  int age = 45;

  print('My name is $firstName $lastName and I am $age years old.');

  String fullInfo = 'My name is $firstName $lastName and I am $age years old'; 
  print(fullInfo);

  List<int> nums = [1, 2, 4];
  print(nums);

  nums.add(3);
  print(nums);

  nums.addAll([2, 3, 4, 5]);
  print(nums);

  nums.removeAt(3);
  nums.removeLast();
  print(nums);

  nums.insert(5, 9);
  print(nums);

  // use for each loop
  nums.forEach((nums) => print(nums));

  // use for loop
  for (int i = 0; i < nums.length; i++) {
    print('Index $i: ${nums[i]}');
  };

  // use while loop
  int test = 0;
  while (test < nums.length) {
    print('Index $test: ${nums[test]}');
    test++;
  }

  // use for in
  for (int num in nums) {
    print(num);
  }
}
