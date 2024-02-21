import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';
import '../reusables/tiles.dart';
import '../reusables/gradient_scaffold.dart';
import '../reusables/color_box.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({Key? key}) : super(key: key);
  static const routeName = '/marks_screen';

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      floatingActionVisible: false,
      appBar: AppBar(
        title: const Text('Marks'),
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
                  child: Text('Class Text'),
                ),
                Expanded(
                  child: Text('Internal'),
                ),
              ],
            ),
            height: 60,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: Provider.of<Student>(context, listen: false)
                  .subjects
                  .map((subject) {
                return MarksTile(
                  name: subject.name,
                  classTest: subject.marks['class_test'],
                  internal: subject.marks['internal'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
