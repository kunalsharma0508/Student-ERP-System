import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/student.dart';

class RollNoMail extends StatelessWidget {
  const RollNoMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Student>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: Text(
            prov.email,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Text(
          prov.roll,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          '${prov.cls} ${prov.semester} ${prov.batch}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
