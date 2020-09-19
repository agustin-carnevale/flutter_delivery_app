import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xff5117ac);
  static final green = Color(0xff20d0c4);
  static final dark = Color(0xff03091E);
  static final grey = Color(0xff212738);
  static final lightGrey = Color(0xffbbbbbb);
  static final veryLightGrey = Color(0xfff3f3f3);
  static final white = Color(0xffffffff);
  static final pink = Color(0xfff5638b);
}

final deliveryGradient = [DeliveryColors.green, DeliveryColors.purple];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DeliveryColors.lightGrey,
    width: 2,
    style: BorderStyle.solid,
  )
);

final lightTheme = ThemeData(
   appBarTheme: AppBarTheme(
    color: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      displayColor: DeliveryColors.purple
    ).copyWith(headline6: TextStyle(
      fontSize: 20,
      color: DeliveryColors.purple,
      fontWeight: FontWeight.bold
    )),
  ),
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(
      color: DeliveryColors.purple
    ),
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.grey,
      fontSize: 10.0,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple
  ),
  primaryIconTheme: IconThemeData(
    color: DeliveryColors.purple
  ),
  accentIconTheme: IconThemeData(
    color: DeliveryColors.purple
  ),
);


final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  )
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      displayColor: DeliveryColors.purple
    ).copyWith(headline6: TextStyle(
      fontSize: 20,
      color: DeliveryColors.white,
      fontWeight: FontWeight.bold
    )),
  ),
  canvasColor: DeliveryColors.grey,
  scaffoldBackgroundColor: DeliveryColors.dark,
  accentColor: DeliveryColors.white,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.green,
    displayColor: DeliveryColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(
      color: DeliveryColors.white
    ),
    fillColor: DeliveryColors.grey,
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.white,
      fontSize: 10.0,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.white
  ),
  primaryIconTheme: IconThemeData(
    color: DeliveryColors.white
  ),
  accentIconTheme: IconThemeData(
    color: DeliveryColors.white
  ),
);
