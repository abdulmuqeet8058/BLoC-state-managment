import 'package:equatable/equatable.dart';

abstract class switchEvents extends Equatable {
  switchEvents();
  @override
  List<Object> get props => [];
}

class EnablOrDisableNotifications extends switchEvents {}

class sliderEvent extends switchEvents {
  double slider;
  sliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
