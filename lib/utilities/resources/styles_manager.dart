import 'package:chatwithfirebase/utilities/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle({required double fontSize, required FontWeight fontWeight, required Color color}) => TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstants.fontFamily,
      color: color,
    );

//Regular Style
TextStyle getRegularTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color,
    );

//Medium Style
TextStyle getMediumTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: color,
    );

//Bold Style
TextStyle getBoldTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color,
    );

//Light Style
TextStyle getLightTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color,
    );

//semiBold Style
TextStyle getSemiBoldTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
