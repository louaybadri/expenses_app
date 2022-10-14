import 'package:flutter/material.dart';

class SettingConfig{
  static double height=0;
  static double width=0;
  static double topPadding=0;
  SettingConfig(BuildContext context){
    height=MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top;
    width=MediaQuery.of(context).size.width;
    topPadding = MediaQuery.of(context).padding.top;
  }
}