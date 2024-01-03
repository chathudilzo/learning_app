import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/common_widgets.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_state.dart';
import 'package:learning_app/pages/register/register_controller.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<RegisterBlocs,RegisterStates>(builder:(context,state){
    return Container(
      color: Colors.white,
      child: SafeArea(child: 
      Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar('Sign Up'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),              Center(child: reusableText('Enter your details below to Sign Up')),
              Container(
                margin: EdgeInsets.only(
                  top: 36.h
                ),
                padding: EdgeInsets.only(left: 25.w,right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('User name'),
                    buildTextField('Enter your user name', 'name','user.png', (value) {
                      context.read<RegisterBlocs>().add(UserNameEvent(value));
                     }),

                    reusableText('Email'),
                    buildTextField('Enter your email address', 'email','user.png',
                    (value){
                      context.read<RegisterBlocs>().add(EmailEvent(value));
                    }
                    ),
                     reusableText('Password'),
                    buildTextField('Enter your password', 'password','lock.png',(value){
                      context.read<RegisterBlocs>().add(PasswordEvent(value));
                    }),

                    reusableText('Confirm Password'),
                    buildTextField('Re-enter your password', 'password', 'lock.png', (value) {
                      context.read<RegisterBlocs>().add(RePasswordEvent(value));
                     }),

                    reusableText('By creating an account you have to agree with our terms and conditions')
                    
                  ],
                ),
              ),
              buildLoginandRegButton('Sign Up','login',(){
                RegisterController(context).handleEmailRegister();
              }),
              
            ],
          ),
        ),
      )
      ),
      
    );
   });
  }
}