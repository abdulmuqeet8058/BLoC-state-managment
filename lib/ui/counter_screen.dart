import 'package:bloc_stmgt/bloc/counter/counterBloc.dart';
import 'package:bloc_stmgt/bloc/counter/counterState.dart';
import 'package:bloc_stmgt/bloc/counter/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Counter example",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<Counterbloc, Counterstate>(builder: (context, state) {
            print("stmgt");
            return Center(
              child: Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<Counterbloc>().add(IncrementCounter());
                  },
                  child: Text("increment")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    context.read<Counterbloc>().add(DecrementCounter());
                  },
                  child: Text("decrement"))
            ],
          )
        ],
      ),
    );
  }
}
