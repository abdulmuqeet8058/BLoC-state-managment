import 'package:bloc/bloc.dart';
import 'package:bloc_stmgt/bloc/switch/switch_event.dart';
import 'package:bloc_stmgt/bloc/switch/switch_states.dart';

class SwitchBloc extends Bloc<switchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnablOrDisableNotifications>(_enableanddisableNotifications);
    on<sliderEvent>(_slider);
  }
  void _enableanddisableNotifications(
      EnablOrDisableNotifications events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(sliderEvent events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
