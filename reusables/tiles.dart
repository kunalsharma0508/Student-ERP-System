import 'package:flutter/material.dart';

class LectureTile extends StatelessWidget {
  const LectureTile(
      {Key? key,
      required this.time,
      required this.name,
      required this.lectureNo})
      : super(key: key);
  final String time;
  final String name;
  final int lectureNo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF).withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF9090FC),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.date_range,
            color: Colors.white,
          ),
        ),
        title: FittedBox(
          child: Text(
            time,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        subtitle: Text(
          name,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.blueGrey,
              ),
        ),
        trailing: Text(
          'Lecture 0$lectureNo',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.blueGrey,
              ),
        ),
      ),
    );
  }
}

class AttendanceTile extends StatelessWidget {
  const AttendanceTile(
      {Key? key,
      required this.name,
      required this.attendedClasses,
      required this.totalClasses})
      : super(key: key);
  final String name;
  final int totalClasses;
  final int attendedClasses;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF).withOpacity(0.8),
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                '$attendedClasses',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                '$totalClasses',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarksTile extends StatelessWidget {
  const MarksTile(
      {Key? key,
      required this.name,
      required this.classTest,
      required this.internal})
      : super(key: key);
  final String name;
  final int classTest;
  final int internal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF).withOpacity(0.8),
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                '$classTest/15',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                '$internal/25',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoClassesTile extends StatelessWidget {
  const NoClassesTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF).withOpacity(0.8),
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'No classes',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
