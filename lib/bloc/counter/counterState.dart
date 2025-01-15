import 'package:equatable/equatable.dart';

class Counterstate extends Equatable {
  final int counter;
  Counterstate({this.counter = 1});

  Counterstate copyWith({int? counter}) {
    return Counterstate(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}
