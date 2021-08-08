import 'dart:io';

class Person {
  String id, Name, Address;
  int Age;

  Person(this.id, this.Name, this.Age, this.Address);
}

//enum SubjectName { Arabic, English, Arithmatic, Since, Islamic, Art }

class Student extends Person {
  String Email, Phone;

  // Map<String, double> Subjects = {
  //   'Arabic': 0,
  //   'English': 0,
  //   'Arithmaic': 0,
  //   'Since': 0,
  //   'Islamic': 0,
  //   'Art': 0
  // };

  //Map<int, int> Subjects = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};
  Map<int, int> Subjects = {};

  Student({
    required id,
    required Name,
    required Age,
    required Address,
    required this.Email,
    required this.Phone,
    // required this.Subjects,
  }) : super(id, Name, Age, Address);

  // void addSubject(String subjectname, double subjectgrade) {
  //   // Subjects.addAll({subjectname: subjectgrade});
  //   Subjects['subjectname'] = subjectgrade;
  // }

  void addSubject(int subjectcode, int subjectdegree) {
    // Subjects.addAll({subjectname: subjectgrade});
    Subjects[subjectcode] = subjectdegree;
  }

  void studentData() {
    // print('ID      : $id');
    // print('Nmae    : $Name');
    // print('Age     : $Age');
    // print('Address :$Address');
    // print('Email   :$Email');
    // print('Phone   :$Phone');

    stdout.write('\n $id   $Name    $Age   $Address     $Email    $Phone \n');

    print('---------------------------------------------------------------');

    Subjects.forEach((key, value) {
      print('Subject Name :$key     Degree  :$value');
    });

    print('---------------------------------------------------------------');
  }
}

class MngStudents {
  final List<Student> _students = [];

  void addStudent({
    required String id,
    required String Name,
    required int Age,
    required String Address,
    required String Email,
    required String Phone,
  }) {
    _students.add(Student(
      id: id,
      Name: Name,
      Age: Age,
      Address: Address,
      Email: Email,
      Phone: Phone,
    ));
  }

  void updateStudentSubject(String id, int subjectcode, int SubjectDegree) {
    var student = _students.firstWhere((element) => element.id == id);
    student.addSubject(subjectcode, SubjectDegree);
  }

  void removeStudent(String id) {
    _students.removeWhere((element) => element.id == id);
  }

  void showAllStudents() {
    print('\n    ID        Nmae       Age        Address     Email  Phone ');

    _students.forEach((element) {
      element.studentData();
    });
  }

  void addSubjectToStudent(String id, int subjectcode, int grade) {
    var student = _students.firstWhere((element) => element.id == id);
    student.addSubject(subjectcode, grade);
  }

  void calculateStudentGrade(String id) {
    int? DegreeSum = 0;
    _students.firstWhere((element) => element.id == id);
    print('----------------------------------  Degree List --------------');
    _students.forEach((element) {
      element.Subjects.forEach((key, value) {
        print('$value');
        DegreeSum = DegreeSum! + value;
      });
    });
    print('-----------------------------------------------------------');

    print('');
    
    if (DegreeSum! < 50) {
      print('Degree Sum : $DegreeSum is  less then 50 ,  you FAIL');
    } else {
      print('Degree Sum : $DegreeSum  Greate than 50 ,  you  is  Good');
    }
    print('-----------------------------------------------------------');
  }
}
