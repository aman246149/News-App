
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context,String message){
  AnimatedSnackBar.material(
    message,
    type: AnimatedSnackBarType.error,
).show(context);
}

void showSuccessSnackBar(BuildContext context,String message){
  AnimatedSnackBar.material(
    message,
    type: AnimatedSnackBarType.success,
).show(context);
}

void showGeneralSnackBar(BuildContext context,String message){
  AnimatedSnackBar.material(
    message,
    type: AnimatedSnackBarType.info,
).show(context);
}