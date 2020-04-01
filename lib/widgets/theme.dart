import 'package:flutter/material.dart';

getColor(context) {
  if(MediaQuery.of(context).platformBrightness == Brightness.dark) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

getTheme(context) {
  if(MediaQuery.of(context).platformBrightness == Brightness.dark) {
    return 'dark';
  } else {
    return 'light';
  }
}

getAppBarTheme(context){
  return new TextStyle(
    color: getColor(context)
  );
}