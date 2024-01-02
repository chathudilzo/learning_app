import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/app_blocs.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
        BlocProvider(create:(context)=>WelcomeBloc(),),
        //BlocProvider(create:(context)=>AppBlocs()),
        BlocProvider(create:(context)=>SignInBloc()),
        BlocProvider(create:(context) => RegisterBlocs(),)
        ];
}