import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({Key? key, required this.child, required this.height})
      : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color(0xFF9090FC),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: height,
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
