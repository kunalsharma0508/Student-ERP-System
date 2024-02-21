import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';
import '../model/subject.dart';
import '../screens/home_page.dart';
import '../services/login_service.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({Key? key}) : super(key: key);

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  String username = '';

  String password = '';
  final LoginService _loginService = LoginService();
  final NetworkService _dataService =
      NetworkService(urlForStudentData: dataUrl);

  void _onPress() async {
    var response = await _loginService.getData(username, password);
    try {
      if (response['accessToken'] != null) {
        String token = response['accessToken'];
        var data = await _dataService.getData(token);
        _setStudent(data, token);
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    } catch (e) {
      print(e);
    }
  }

  void _setStudent(var data, String token) {
    List<Subject> mySubjects = [];
    var temp = data['subject'] as List;
    for (int i = 0; i < temp.length; i++) {
      var currSubject = data['subject'][i];
      Subject subject = Subject(
          name: currSubject['name'],
          totalClass: currSubject['total_class'] as int,
          attendedClass: currSubject['attended_class'] as int,
          marks: currSubject['marks'] as Map<String, dynamic>);
      mySubjects.add(subject);
    }
    Provider.of<Student>(context, listen: false).updateStudent(
      Student(
          name: data['name'],
          roll: data['roll'],
          cls: data['class'],
          email: data['email'],
          semester: data['semester'],
          batch: data['batch'],
          designation: data['designation'],
          attendance: data['attendance'],
          subjects: mySubjects,
          token: token),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Widget roundTextField(String hintText, bool secureText, Function onChange) {
      return TextField(
        onChanged: (value) {
          onChange(value);
        },
        obscureText: secureText,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      );
    }

    return SizedBox(
      height: height * 0.27,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          roundTextField('Username', false, (value) {
            username = value;
          }),
          roundTextField('Password', true, (value) {
            password = value;
          }),
          InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorDark,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
