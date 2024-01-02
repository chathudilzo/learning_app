import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super(SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }



  void _emailEvent(EmailEvent event,Emitter<SignInState>emit){
    //print('Email is in emit: ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event,Emitter<SignInState>emit){
    //print('Password is in emit: ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}