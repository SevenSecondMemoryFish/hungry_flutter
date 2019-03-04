
import 'dart:ui';
import 'package:flutter/material.dart';

 class ColorTool {
   ColorTool._();
   static Color hexColor(String hex,{Color color = Colors.black26}){
     if(hex == null || hex.isEmpty)return color;
    int colorInt =  hexToInt(hex);
    return new Color(colorInt);
  }

   static int hexToInt(String colorStr)
   {
     colorStr = "FF" + colorStr;
     colorStr = colorStr.replaceAll("#", "");
     int val = 0;
     int len = colorStr.length;
     for (int i = 0; i < len; i++) {
       int hexDigit = colorStr.codeUnitAt(i);
       if (hexDigit >= 48 && hexDigit <= 57) {
         val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
       } else if (hexDigit >= 65 && hexDigit <= 70) {
         // A..F
         val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
       } else if (hexDigit >= 97 && hexDigit <= 102) {
         // a..f
         val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
       } else {
         throw new FormatException("An error occurred when converting a color");
       }
     }
     return val;
   }

}