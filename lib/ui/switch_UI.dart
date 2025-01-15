import 'package:bloc_stmgt/bloc/switch/switch_bloc.dart';
import 'package:bloc_stmgt/bloc/switch/switch_event.dart';
import 'package:bloc_stmgt/bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example two"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnablOrDisableNotifications());
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(sliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
