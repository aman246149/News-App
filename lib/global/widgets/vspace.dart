import 'package:flutter/material.dart';

class Vspace extends StatelessWidget {
  const Vspace({super.key,this.height=0});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}