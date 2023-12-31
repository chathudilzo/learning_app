import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/firebase_options.dart';
import 'package:learning_app/global.dart';


void main()async {

  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers:[...AppPages.allBlocProviders(context)] ,
    child: ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:(BuildContext context,child)=>MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.primaryText
          ),
          elevation: 0,
          backgroundColor: Colors.white
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home:const Welcome(),
      onGenerateRoute: AppPages.GenerateRouteSettings,
      // routes: {
      //   //'myHomePage':(context)=>const MyHomePage(),
      //   "signIn":(context)=>const SignIn(),
      //   "register":(context)=>const Register()
      // },
    ),));
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key,});





//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
       
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
   
//         title: Text('Home Page'),
//       ),
//       body: Center(
    
//         child: BlocBuilder<AppBlocs,AppStates>(builder: (context,state){
//           return Column(
         
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '${BlocProvider.of<AppBlocs>(context).state.counter}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         );
//         })
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: 'heroTag1',
//         onPressed:()=> BlocProvider.of<AppBlocs>(context).add(Increment()),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//       FloatingActionButton(
//         heroTag: 'heroTag2',
//         onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Decrement()),
//         tooltip: 'Decrement',
//         child: const Icon(Icons.remove),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//         ],
//       )
//     );
//   }
// }
