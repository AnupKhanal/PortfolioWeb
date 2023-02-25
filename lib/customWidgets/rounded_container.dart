import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const RoundedContainer(
      {super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey[100]
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: child));
  }
}
