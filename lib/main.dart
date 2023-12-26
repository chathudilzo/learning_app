import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/app_blocs.dart';
import 'package:learning_app/app_events.dart';
import 'package:learning_app/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>AppBlocs(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
   
        title: Text(title),
      ),
      body: Center(
    
        child: BlocBuilder<AppBlocs,AppStates>(builder: (context,state){
          return Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${BlocProvider.of<AppBlocs>(context).state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        );
        })
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
        onPressed:()=> BlocProvider.of<AppBlocs>(context).add(Increment()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      FloatingActionButton(
        onPressed: ()=>BlocProvider.of<AppBlocs>(context).add(Decrement()),
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      )
    );
  }
}
