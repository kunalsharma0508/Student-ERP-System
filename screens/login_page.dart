import 'package:flutter/material.dart';

import '../widgets/login_box.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.3)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.school_sharp,
                  color: Colors.white,
                  size: 50,
                ),
                const SizedBox(width: 15),
                Text(
                  'Login to ',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'ERP',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const FittedBox(
              child: Text(
                'Jagannath International Management School',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const LoginBox(),
          ],
        ),
      ),
    );
  }
}
