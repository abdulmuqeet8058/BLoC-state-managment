import 'package:bloc_stmgt/bloc/counter(local%20BLoC)/counterBloc.dart';
import 'package:bloc_stmgt/bloc/counter(local%20BLoC)/counterState.dart';
import 'package:bloc_stmgt/bloc/counter(local%20BLoC)/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_UI extends StatefulWidget {
  const Counter_UI({super.key});

  @override
  State<Counter_UI> createState() => _Counter_UIState();
}

class _Counter_UIState extends State<Counter_UI> {
  late Counterbloc _counterbloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterbloc = Counterbloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterbloc.close();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return BlocProvider(
      create: (_) => _counterbloc,
      child: Scaffold(
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
            BlocBuilder<Counterbloc, Counterstate>(
              builder: (context, state) {
                print("stmgt");
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<Counterbloc, Counterstate>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    print("stmgt");
                    return ElevatedButton(
                      onPressed: () {
                        context.read<Counterbloc>().add(IncrementCounter());
                      },
                      child: Text("increment"),
                    );
                  },
                ),
                SizedBox(width: 10),
                BlocBuilder<Counterbloc, Counterstate>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    print("stmgt");
                    return ElevatedButton(
                      onPressed: () {
                        context.read<Counterbloc>().add(DecrementCounter());
                      },
                      child: Text("decrement"),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
