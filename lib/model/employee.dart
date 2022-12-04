class Employee {
  int id;
  String imageUrl;
  String firstName;
  String lastName;
  String email;
  String contactNumber;
  int age;
  String dob ;
  double salary;
  String address;

  Employee({this.id = 0, this.imageUrl="", this.firstName="", this.lastName="", this.email="", this.contactNumber="",
    this.age=0, this.dob="", this.salary=0, this.address=""});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        imageUrl: json['imageUrl'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        contactNumber: json['contactNumber'],
        age: json['age'],
        dob: json['dob'],
        salary: json['salary'],
        address: json['address']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['contactNumber'] = contactNumber;
    data['age'] = age;
    data['dob'] = dob;
    data['salary'] = salary;
    data['address'] = address;
    return data;
  }
}