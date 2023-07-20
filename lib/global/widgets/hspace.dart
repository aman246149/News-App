import 'package:flutter/material.dart';

class Hspace extends StatelessWidget {
  const Hspace({super.key,this.width=0});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}