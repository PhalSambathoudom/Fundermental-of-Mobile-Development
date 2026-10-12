enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final int _yearOfExperience;
  final Address _employeeAddress;

  Employee(
    this._name,
    this._baseSalary,
    this._skill,
    this._yearOfExperience,
    this._employeeAddress,
  );

  String get name => this._name;
  double get baseSalary => this._baseSalary;
  List<Skill> get skill => this._skill;
  int get yearOfExperience => this._yearOfExperience;
  Address get employeeAddress => this._employeeAddress;

  Employee.mobileDeveloper(
    String _name,
    double _baseSalary,
    int _yearOfExperience,
    Address employeeAddress,
  ) : this(
        _name,
        _baseSalary,
        [Skill.DART, Skill.FLUTTER],
        _yearOfExperience,
        employeeAddress,
      );

  void printDetails() {
    print(
      '\nEmployee\t : $name'
      '\nBase Salary\t : \$${baseSalary}'
      '\nSkill\t\t : ${skill.map((e) => e.name).join(', ')}'
      '\nYearOfExperience : $yearOfExperience years\n'
      '\n$employeeAddress',
    );
  }

  void computeSalary() {
    const double expBonus = 2000;
    double totalBonus = 0;
    for (var skill in _skill) {
      switch (skill) {
        case Skill.FLUTTER:
          totalBonus += 5000; // FLUTTER bonus: $5,000
          break;
        case Skill.DART:
          totalBonus += 3000; // DART bonus: $3,000
          break;
        case Skill.OTHER:
          totalBonus += 1000; // OTHER bonus: $1,000
          break;
      }
    }
    double totalSalary =
        _baseSalary + totalBonus + (expBonus * _yearOfExperience);

    print(
      '\nSalary Specification: '
      '\n\tBase Salary : \$$_baseSalary'
      '\n\tEach year of experience adds : \$$expBonus.'
      '\n\tEach skill adds a different bonus : '
      '\n\t\t Flutter: \$5000'
      '\n\t\t Dart\t: \$3000'
      '\n\t\t Other\t: \$1000'
      '\nTotal Salary : \$$totalSalary',
    );
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address({
    required this._street,
    required this._city,
    required this._zipCode,
  });

  String get street => this._street;
  String get city => this._city;
  String get zipCode => this._zipCode;

  @override
  String toString() {
    return 'Employee Address Information : '
        '\nStreet\t\t : $street'
        '\nCity\t\t : $city'
        '\nZip Code\t : $zipCode';
  }
}

void main() {
  Employee emp1 = Employee(
    'Dom',
    40000,
    [Skill.FLUTTER],
    5,
    Address(street: '123A', city: 'Kampot', zipCode: "IDTB110"),
  );
  emp1.printDetails();
  emp1.computeSalary();

  Employee emp2 = Employee.mobileDeveloper(
    'Phal',
    40000,
    5,
    Address(street: '254', city: 'Phnom Penh', zipCode: '342323423'),
  );
  emp2.printDetails();
  emp2.computeSalary();
}
