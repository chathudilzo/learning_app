


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/home/bloc/home_page_events.dart';
import 'package:learning_app/pages/home/bloc/home_page_state.dart';

class HomePageBlocs extends Bloc<HomepageEvents,HomePageStates>{
  HomePageBlocs():super(const HomePageStates()){
    on<HomePageDots>(_homePageDots);
  }



  void _homePageDots(HomePageDots event,Emitter<HomePageStates>emit){
    emit(state.copyWith(event.index));
  }
}