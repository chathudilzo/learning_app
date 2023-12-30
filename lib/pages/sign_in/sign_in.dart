import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(child: 
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('LogIn', style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp
        ),),),
      )),
    );
  }
}