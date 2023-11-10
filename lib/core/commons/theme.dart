import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: colors.AppColors.primaryColor,
  scaffoldBackgroundColor: colors.AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    color: colors.AppColors.primaryColor,
    iconTheme: IconThemeData(
      color: colors.AppColors.accentLightColor,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: colors.AppColors.accentLightColor,
    disabledColor: colors.AppColors.accentLightColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: colors.AppColors.accentColor,
  ),
);
