import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';

class RegisterController{
final BuildContext context;

const RegisterController(this.context);

void handleEmailRegister()async{
  final state=context.read<RegisterBlocs>().state;

  String userName=state.userName;
  String email=state.email;
  String password=state.password;
  String rePassword=state.rePassword;

  if(userName.isEmpty){
    toastInfo(msg: 'User name cannot be empty');
    return;
  }
  if(email.isEmpty){
    toastInfo(msg: 'Email cannot be empty');
    return;

  }
  if(password.isEmpty){
    toastInfo(msg: 'Password cannot be empty');
    return;
  }
  if(rePassword.isEmpty || rePassword!=password){
    toastInfo(msg: 'Password miss match');
    return;
  }

  try{
    final credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    if(credential.user!=null){
      await credential.user?.sendEmailVerification();
      await credential.user?.updateDisplayName(userName);
      toastInfo(msg: 'An email has been sent to your email address, please check the email box to activate the account');
      
      Navigator.of(context).pop();
    }

  }on FirebaseAuthException catch(e){
    if(e.code=='weak-password'){
      toastInfo(msg:'The password provided is weak');
    }else if(e.code=='email-already-in-use'){
      toastInfo(msg:'The email is already in use');
    }else if(e.code=='invalid-email'){
      toastInfo(msg: 'Invalid Email address');
    }else{
      toastInfo(msg: e.code.toString());
    }
  }
}


}