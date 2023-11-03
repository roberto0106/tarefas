import 'package:flutter/material.dart';

// 0xFF9ac1f0,0xFF72fa93,0xFFa0e548,0xFFe45f2b,0xFFf6c445

class AppColors {
  static const Color primaryBlue = Color(0xFF9ac1f0);
  static const Color primaryGreen = Color(0xFF72fa93);
  static const Color lightGreen = Color(0xFFa0e548);
  static const Color lightOrange = Color(0xFFe45f2b);
  static const Color ligthYelow = Color(0xFFf6c445);
  // Adicione mais cores conforme necessário...
}

class AppTheme {
  AppTheme._();

  // Tema principal
  static final ThemeData light = ThemeData(
      // primaryColor: AppColors.primaryRed,
      // primaryColorDark: AppColors.secondaryBlueGray,
      // secondaryHeaderColor: AppColors.secondaryBlueGray,
      // errorColor: AppColors.errorRed,
      // hintColor: AppColors.lightCream,
      // colorScheme: ColorScheme.fromSwatch().copyWith(
      //   secondary: AppColors.primaryBlue,
      // ),
      // ... outros aspectos do tema
      );
}
