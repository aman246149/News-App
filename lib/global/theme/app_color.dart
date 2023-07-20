import 'package:flutter/material.dart';

class AppColor{
  AppColor._();
  static const Color purple=Color(0xffe1cdff);
  static const Color cyan=Color(0xffbdf3f7);
  static const Color yellow=Color(0xfff2f7bd);
  static const Color green=Color(0xffceffd3);
  static const Color blueAccent = Color(0xFF6750A4);
  static const Color gradient1 = Color(0xFF6C9CFF);
  static const Color gradient2 = Color(0xFFB2A6FF);
  static const Color lightWhite = Color(0xFFEADDFF);
  static const Color red = Color(0xFFD90429);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color grey3 = Color(0xFFd9d9d9);
  static const Color grey1 = Color(0xFF8E8E93);
  static const Color whitishGrey = Color(0xFFEEEEEE);
  static const Color outlineBorder = Color(0xFFD6DBDE);
  static const Color lightGrey = Color(0xFF9DA3A4);
  static const Color greyShade211 = Color(0xffF1EDEE);
  static const Color greyBackground = Color(0xff292929);
  static const Color white1 = Color(0xffD1D1D1);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color blackShade1A = Color(0XFF1A1A1A);
  static const Color blackShade32 = Color(0XFF323232);
  static const Color transparent = Colors.transparent;
  static const Color redColor = Colors.red;
  static const Color greenColor = Color(0xff01BC82);
  static const Color appBackgroundColor = Color(0xffF0F0F5);
  static const Color filterColor = Color(0xffEEEEEE);
  static const Color blackShade272727 = Color(0xff272727);
  static const Color lightWhite2 = Color(0xffDADADA);
  static const Color silverColor = Color(0xff6D8A9C);
  static const Color greyishWhite = Color(0xffE7E7E7);
  static const Color silverWhite = Color(0xFFDDDDDD);
  static const Color filterGrey = Color(0xFFEFF0F6);
  static const Color greyMedium = Color.fromRGBO(233, 233, 233, 1);
  static Color greyLight = Colors.grey.shade100;
  static const Color royalBlue = Color(0xFF072AC8);
  static const Color blackShade5057 = Color(0xff272727);
  static const Color lightYellow = Color(0xffFDF6E9);
  static const Color lightBlue = Color(0xffF0F1FE);
  static const Color lightPink = Color(0xffFCF1FB);
  static const Color lightGrey3 = Color(0xffDADBE4);
  static const Color lightGrey2 = Color.fromRGBO(249, 249, 249, 1);
  static const greyishBlue = Color(0xff28325A);

  static Color mixColor(Color color1, [Color color2 = Colors.black]) {
    return Color.alphaBlend(color1, color2);
  }
}