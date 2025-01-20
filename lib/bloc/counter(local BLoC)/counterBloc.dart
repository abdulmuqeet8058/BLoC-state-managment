import 'package:bloc/bloc.dart';
import 'package:bloc_stmgt/bloc/counter(local%20BLoC)/counterState.dart';
import 'package:bloc_stmgt/bloc/counter(local%20BLoC)/counter_events.dart';

class Counterbloc extends Bloc<CounterEvents, Counterstate> {
  Counterbloc() : super(Counterstate()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }
  void _increment(IncrementCounter event, Emitter<Counterstate> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<Counterstate> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
