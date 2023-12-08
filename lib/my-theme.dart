import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color navyColor = Color(0xff003E90);
  static Color blueColor = Color(0xff4882CF);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyColor = Color(0xff4F5A69);
  static Color redColor = Color(0xffC91C22);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color yellowColor = Color(0xffF2D352);
  static Color titleGreyColor = Color(0xff79828B);
  static Color blackColor = Color(0xff303030);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        )),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: greyColor,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        // fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: greyColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      displayLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );
}
