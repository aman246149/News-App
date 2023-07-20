import 'package:flutter/material.dart';

import 'app_color.dart';


class AppStyle {
  // Bold, 16, whiteBold
  static TextStyle get whiteBold16 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get blackBold16 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get blackBold24 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get greyRegular20 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.grey,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get blackMedium16 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  // Bold, 14, grey Medium
  static TextStyle get greyMedium14 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      color: AppColor.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get redMedium10 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      fontSize: 8.0,
      color: AppColor.red,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get silver12w400 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      fontSize: 10.0,
      color: AppColor.silverColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get lightBlackw600 {
    return const TextStyle(
      fontFamily: AppFonts.montserrat,
      fontSize: 10.0,
      color: AppColor.blackShade272727,
      fontWeight: FontWeight.w600,
    );
  }
}


abstract class AppFonts {
  static const montserrat = 'Montserrat';
}
