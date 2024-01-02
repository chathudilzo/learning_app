import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//{} means with default values you can ignore passthing that values
toastInfo({
  required String msg,
  Color backGroundCololor=Colors.black,
  Color textColor=Colors.white
}){
  return Fluttertoast.showToast(msg: msg,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP,
  timeInSecForIosWeb: 2,
  backgroundColor: backGroundCololor,
  textColor: textColor,
  fontSize: 16.sp);
}