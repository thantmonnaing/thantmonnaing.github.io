import 'package:flutter/material.dart';

class GlobalValue{

  static dynamicWidth(double width){
    return width /2 > 350 ? 350 : width/2;
  }

  static dynamicHeight(double width,double height){
    return width /2 > 350 ? 200 : 200;
  }

  static checkWidth(double width){
    if((width / 2 ) > 350){
      return false;
    }else{
      return true;
    }
  }

}
