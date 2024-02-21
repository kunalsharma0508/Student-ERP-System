import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';

class AttendanceName extends StatelessWidget {
  const AttendanceName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double attendance = Provider.of<Student>(context, listen: false).attendance;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: Text(
            Provider.of<Student>(context, listen: false).name,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Text(
          'Attendance',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          '${attendance.toStringAsFixed(2)}%',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            FractionallySizedBox(
              widthFactor: attendance / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: (attendance > 50.0)
                      ? Theme.of(context).primaryColor
                      : Colors.redAccent,
                  borderRadius: BorderRadius.circular(6),
                ), 
                height: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
