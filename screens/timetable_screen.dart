import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';
import '../reusables/color_box.dart';
import '../reusables/tiles.dart';
import '../reusables/gradient_scaffold.dart';
import '../services/login_service.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);
  static const routeName = '/timetable_screen';

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  final NetworkService _timetableService =
      NetworkService(urlForStudentData: timeTableUrl);
  @override
  void initState() {
    setThings();
    super.initState();
  }

  List mondayClasses = [];
  List tuesdayClasses = [];
  List wednesdayClasses = [];
  List thursdayClasses = [];
  List fridayClasses = [];
  List saturdayClasses = [];
  void setThings() async {
    String token = Provider.of<Student>(context, listen: false).token;
    var response = await _timetableService.getData(token);
    mondayClasses = response['monday'];
    tuesdayClasses = response['tuesday'];
    wednesdayClasses = response['wednesday'];
    thursdayClasses = response['thursday'];
    fridayClasses = response['friday'];
    saturdayClasses = response['saturday'];
    setState(() {});
  }

  Widget getTitle(String day) {
    return Column(
      children: [
        if (day != 'Monday')
          const SizedBox(
            height: 30,
          ),
        ColorBox(
          child: Text(day),
          height: 40,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      floatingActionVisible: false,
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getTitle('Monday'),
            if (mondayClasses.isNotEmpty)
              ...mondayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: mondayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (mondayClasses.isEmpty) const NoClassesTile(),
            getTitle('Tuesday'),
            if (tuesdayClasses.isNotEmpty)
              ...tuesdayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: tuesdayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (tuesdayClasses.isEmpty) const NoClassesTile(),
            getTitle('Wednesday'),
            if (wednesdayClasses.isNotEmpty)
              ...wednesdayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: wednesdayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (wednesdayClasses.isEmpty) const NoClassesTile(),
            getTitle('Thursday'),
            if (thursdayClasses.isNotEmpty)
              ...thursdayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: thursdayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (thursdayClasses.isEmpty) const NoClassesTile(),
            getTitle('Friday'),
            if (fridayClasses.isNotEmpty)
              ...fridayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: fridayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (fridayClasses.isEmpty) const NoClassesTile(),
            getTitle('Saturday'),
            if (saturdayClasses.isNotEmpty)
              ...saturdayClasses
                  .map((lecture) => LectureTile(
                      time: lecture['timing'],
                      name: lecture['subject'],
                      lectureNo: saturdayClasses.indexOf(lecture) + 1))
                  .toList(),
            if (saturdayClasses.isEmpty) const NoClassesTile(),
          ],
        ),
      ),
    );
  }
}
