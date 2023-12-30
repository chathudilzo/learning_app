import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_sate.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    print('welcome bloc');
    on<WelcomeEvent>((event,emit){
      emit(WelcomeState(page: state.page));
    });
  }
}