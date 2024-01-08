

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/application/bloc/app_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:learning_app/pages/profile/settings/settings_page.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:learning_app/pages/sign_in/sign_in.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learning_app/pages/welcome/welcome.dart';


class AppPages{
  static List<PageEntity> routes(){
    return [
    PageEntity(route: AppRoutes.INITIAL,
     page: const Welcome(),
      bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
    PageEntity(route: AppRoutes.SIGN_IN,
     page: const SignIn(),
      bloc: BlocProvider(create: (_)=>SignInBloc(),)),
    PageEntity(route: AppRoutes.REGISTER,
     page: const Register(),
      bloc: BlocProvider(create: (_)=>RegisterBlocs(),)),
    PageEntity(route: AppRoutes.APPLICATION,
     page: const ApplicationPage(),
      bloc: BlocProvider(create: (_) =>AppBlocs() ,)
      ),
      PageEntity(route: AppRoutes.HOME_PAGE, page: HomePage(),bloc: BlocProvider(create:(_)=>HomePageBlocs())),
      PageEntity(route: AppRoutes.SETTINGS, page: SettingsPage(),bloc: BlocProvider(create: (_)=>SettingsBlocs()))      
  ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders=<dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

//model that covers entire screen when click on navigator obj
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      //check for rotes name matching when nav get triggered
      var result=routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
         bool deviceFirstOpen=Global.storageService.getDeviceFirstOpen();//returns true if already opend once
        // //if route is welcome and device open is true
         if(result.first.route==AppRoutes.INITIAL && deviceFirstOpen){
           bool isLoggedIn=Global.storageService.getIsLogedIn();//
           if(isLoggedIn){
             return MaterialPageRoute(builder: (_)=>const ApplicationPage(),settings: settings);
           }

           return MaterialPageRoute(builder: (_)=>SignIn(),settings: settings);
         }

        return MaterialPageRoute(builder:(_)=>result.first.page,settings: settings);
      }
    }
    print('Invalid route name:${settings.name}');
    return MaterialPageRoute(builder:(_)=>SignIn(),settings: settings);
  }
}

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route,required this.page, this.bloc});

}