import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/login_service.dart';
import '../reusables/gradient_scaffold.dart';
import '../reusables/color_box.dart';
import '../reusables/tiles.dart';
import '../widgets/mail_rollno.dart';
import '../widgets/attendance_name.dart';
import '../model/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkService _lectureService =
      NetworkService(urlForStudentData: lecturesUrl);
  @override
  void initState() {
    _setLectures();
    super.initState();
  }

  List response = [];
  void _setLectures() async {
    String token = Provider.of<Student>(context, listen: false).token;
    if (token != '') {
      response = await _lectureService.getData(token);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GradientScaffold(
      floatingActionVisible: true,
      appBar: AppBar(
        title: const Text('KIET'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ColorBox(
                      child: const AttendanceName(),
                      height: width * 0.4,
                    ),
                  ),
                  Expanded(
                    child: ColorBox(
                      child: const RollNoMail(),
                      height: width * 0.4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Incoming Lessons',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '   ${DateFormat.EEEE().format(DateTime.now())}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              if (response.isNotEmpty)
                ...response.map((lecture) {
                  return LectureTile(
                    name: lecture['subject'],
                    time: lecture['timing'],
                    lectureNo: response.indexOf(lecture) + 1,
                  );
                }).toList(),
              if (response.isEmpty)
                const ColorBox(
                  child: Text('No Classes'),
                  height: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
