import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';
import '../reusables/color_box.dart';
import '../reusables/tiles.dart';
import '../reusables/gradient_scaffold.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);
  static const routeName = '/attendance_screen';

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      floatingActionVisible: false,
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Column(
        children: [
          ColorBox(
            child: Row(
              children: const [
                Expanded(
                  child: Text('Subject'),
                ),
                Expanded(
                  child: Text('Attended Classes'),
                ),
                Expanded(
                  child: Text('Total Classes'),
                ),
              ],
            ),
            height: 60,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: Provider.of<Student>(context, listen: false)
                  .subjects
                  .map((subject) {
                return AttendanceTile(
                  name: subject.name,
                  attendedClasses: subject.attendedClass,
                  totalClasses: subject.totalClass,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
