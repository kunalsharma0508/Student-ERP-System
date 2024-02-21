import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/student.dart';
import '../screens/navigation_drawer.dart';

const onlineClassUrl = 'https://my-erp-api.herokuapp.com/meeting/';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold(
      {Key? key,
      required this.appBar,
      required this.body,
      required this.floatingActionVisible})
      : super(key: key);

  final AppBar appBar;
  final Widget body;
  final bool floatingActionVisible;

  void _joinClass(context) async {
    String token = Provider.of<Student>(context, listen: false).token;
    final Uri url = Uri.parse(onlineClassUrl + token);
    try {
      await launchUrl(url);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: const NavigationDrawers(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFF3399FF).withOpacity(0.75),
            ],
          ),
        ),
        child: body,
      ),
      floatingActionButton: (floatingActionVisible == true)
          ? FloatingActionButton(
              onPressed: () {
                _joinClass(context);
              },
              child: const Text('Join'),
            )
          : Container(),
    );
  }
}
