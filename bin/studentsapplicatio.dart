import 'dart:io';
import 'college_system.dart';

void main() {
  var mngstudents = MngStudents();

  loop:
  while (true) {
    print('');
    print('----------------------------- College TASK (  Atef Mansour ) -------------------');
    print('1- Add Student');
    print('2- Remove Student');
    print('3- Add Degree of Subject');
    print('4- Print student Data');
    print('5- Show Student Grade');
    print('6-Exit');
    print('--------------------------------------------------------------------------------');
   
    var operation = int.parse(stdin.readLineSync()!);

    switch (operation) {
      case 6:
        break loop;

      case 1: // Add student
        print('\nEnter id,Name,Age,Address,Email,Phone');
        var input = stdin.readLineSync()!.split(',');

        mngstudents.addStudent(
            id: input[0],
            Name: input[1],
            Age: int.parse(input[2]),
            Address: input[3],
            Email: input[4],
            Phone: input[5]);

        break;
      case 2: //   Remove student
        print('\nEnter Student ID');
        var input = stdin.readLineSync()!;
        mngstudents.removeStudent(input);
        break;

      case 3: // ADD Degree of subject
        print('\nEnter ID, Subject Code , Degree');
        print(
            'Enter 1,2,3..,6 For Subject (1-Arabic, 2-English, 3-Arithmatic, 4-Since, 5-Islamic, 6-Art');
        var input = stdin.readLineSync()!.split(',');
        mngstudents.updateStudentSubject(
            input[0], int.parse(input[1]), int.parse(input[2]));
        break;

      case 4: // Print Student Datat
        mngstudents.showAllStudents();
        break;

      case 5: // Show Final Student Grade
        print('\nEnter Student ID');
        var input = stdin.readLineSync()!;

        mngstudents.calculateStudentGrade(input);
        break;

      default:
        print('Enter Valid Choice');
    }
  }
}
