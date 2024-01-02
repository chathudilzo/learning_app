import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_blocs.dart';

class SignInController{
final BuildContext context;

  const SignInController({
    required this.context
  });

  void handleSignIn(String type)async{
    try{
      if(type=='email'){
        //BlocProvider.of<SignInBloc>(context).state
        final state=context.read<SignInBloc>().state;

        String emailAddress=state.email;
        String password=state.password;

        if(emailAddress.isEmpty){
          toastInfo(msg: 'Email address cannot be empty!');
          return;
        }

        if(password.isEmpty){
         toastInfo(msg: 'Password cannot be empty!');
         return;
        }
        try{
          final credential=await FirebaseAuth.instance.
          signInWithEmailAndPassword(email: emailAddress, password: password);
          if(credential.user==null){
            toastInfo(msg: 'User account does not exists!');
            return;
          }
          if(!credential.user!.emailVerified){
            toastInfo(msg: 'Email is not verified');
            return;
          }

          var user=credential.user;

          if(user!=null){
              print('have a user');
          }else{
            toastInfo(msg: 'Not a user of this app');
            return;
            //have no vf use
          }

        }on FirebaseAuthException catch(error){
          if(error.code=="user-not-found"){
            print('No user found for that email');
            toastInfo(msg: 'User not found!');
          }else if(error.code=='wrong-password'){
            print(' Wrong password for that user');
            toastInfo(msg: 'Invalid email or password');
          }else if(error.code=='invalid-email'){
            print('Invalid email address');
            toastInfo(msg: 'Invalid email address');
          }
          
           else{
             print(error.toString());
             toastInfo(msg: error.message.toString());
           }
        }


      }
    }catch(error){

    }
  }
}