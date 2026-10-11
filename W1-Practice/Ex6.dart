// int? sum(int num1, int num2) {
//   return num1 + num2;
// }

// void main() {
//   print(sum(3, 2));
// }

// void fullName (String firstName, String lastName) {
//   print('$firstName $lastName');
// }

// void main() {
//   fullName('Ronan', 'Ogor');
// }

// void fullName({ required String firstName, required String lastName}) {
//   print('$firstName $lastName');
// }

// void main() {
//   fullName(firstName: 'Ronan', lastName: 'Ogor');
// }`

// void fullName(String firstName, String lastName) {
//   print('$firstName $lastName');
// }

// void fullName2 ({required String firstName2, required String lastName2}) {
//   print('$firstName2, $lastName2');
// }

// void main() {
//   fullName('Ronan', 'Oger');
//   fullName2(firstName2: 'Ronan', lastName2: 'Ogor');
// }

// int sum(int num, int num2) => num + num2;

// void main() {
//   print(sum(3, 2));
// }

void greet({String? name, String? greeting}) {
  print('$greeting, $name!');
}

void fullName({String? firstName, String? lastName}) {
  print('$firstName $lastName');
}

void main() {
  greet(name: 'Ronan', greeting: 'Hello'); 
  greet(name: 'Ronan');               
  greet(greeting: 'Hi');                  
  greet();                         

  fullName(firstName: 'Phal', lastName: 'Sambathoudom');
  fullName(firstName: 'Seng', lastName: 'Namkea');
  fullName(firstName: 'Dom');
  fullName(lastName: 'Ko');
  fullName();        
}

