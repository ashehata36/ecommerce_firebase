import 'package:chatwithfirebase/app/constants.dart';
import 'package:chatwithfirebase/utilities/resources/font_manager.dart';
import 'package:chatwithfirebase/utilities/resources/styles_manager.dart';
import 'package:chatwithfirebase/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) => ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kBGColor,
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      iconTheme: const IconThemeData(color: kContentColorLightTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(bodyColor: kContentColorLightTheme),
      colorScheme: const ColorScheme.light(primary: kPrimaryColor, secondary: kSecondaryColor, error: kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
          unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
          selectedIconTheme: const IconThemeData(color: kPrimaryColor),
          showUnselectedLabels: true),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularTextStyle(color: kContentColorLightTheme, fontSize: FontSize.s14),
        labelStyle: getMediumTextStyle(color: kContentColorLightTheme, fontSize: FontSize.s14),
        errorStyle: getRegularTextStyle(color: kErrorColor),
        counterStyle: getRegularTextStyle(color: kContentColorLightTheme, fontSize: FontSize.s14),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondColorLightTheme, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kContentColorLightTheme, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondColorLightTheme, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kSecondColorLightTheme, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kErrorColor, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s14)),
      ),
      //Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldTextStyle(color: kWhiteColor, fontSize: FontSize.s16),
          backgroundColor: kPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s18),
          ),
        ),
      ),
    );
