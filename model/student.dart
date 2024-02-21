import 'package:flutter/cupertino.dart';
import 'subject.dart';

class Student with ChangeNotifier {
  String name;
  String roll;
  String cls;
  String email;
  int semester;
  String batch;
  String designation;
  double attendance;
  List<Subject> subjects;
  String token;

  Student({
    required this.name,
    required this.roll,
    required this.cls,
    required this.email,
    required this.semester,
    required this.batch,
    required this.designation,
    required this.attendance,
    required this.subjects,
    required this.token,
  });

  void updateStudent(Student student) {
    name = student.name;
    roll = student.roll;
    cls = student.cls;
    email = student.email;
    semester = student.semester;
    batch = student.batch;
    designation = student.designation;
    attendance = student.attendance;
    subjects = student.subjects;
    token = student.token;
  }
}
