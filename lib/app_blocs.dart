import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/app_events.dart';
import 'package:learning_app/app_state.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
 AppBlocs():super(InitStates()){
  print('App bloc');
  on<Increment>((event,emit){
    emit(AppStates(counter: state.counter+1));
  });

  on<Decrement>((event, emit) {
    emit(AppStates(counter: state.counter-1));
  },);

 }


 
  
}