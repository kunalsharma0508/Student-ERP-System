import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';
import '/screens/timetable_screen.dart';
import '/screens/marks_screen.dart';
import '/screens/attendance_screen.dart';
import '/screens/home_page.dart';
import '/screens/login_page.dart';

class NavigationDrawers extends StatelessWidget {
  const NavigationDrawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.5),
              Theme.of(context).primaryColor.withOpacity(0.2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'KIET ERP',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 25,
                    color: Colors.indigo,
                  ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              leading: const Icon(
                Icons.dashboard_sharp,
                color: Colors.white,
              ),
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, TimeTableScreen.routeName);
              },
              leading: const Icon(
                Icons.schedule,
                color: Colors.white,
              ),
              title: Text(
                'Timetable',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AttendanceScreen.routeName);
              },
              leading: const Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              title: Text(
                'Attendance',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, MarksScreen.routeName);
              },
              leading: const Icon(
                Icons.bar_chart_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Marks',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                title: Text(
                  Provider.of<Student>(context, listen: false).name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                      ),
                ),
                subtitle: Text(
                  Provider.of<Student>(context, listen: false).designation,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'LogOut',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
