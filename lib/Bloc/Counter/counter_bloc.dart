import 'package:bloc_api_app/Bloc/Counter/counter_event.dart';
import 'package:bloc_api_app/Bloc/Counter/counter_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc():super(CounterInitialState(count: 0)){
    // on increment event
    on<CounterIncrementEvent>((event, emit){
      emit(CounterIncrementState(incCount: event.incCount+1));
    });

    // on decrement event
    on<CounterDecrementEvent>((event, emit){
      emit(CounterDecrementState(decCount: event.decCount-1));
    });
  }
}