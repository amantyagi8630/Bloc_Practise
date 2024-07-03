import 'package:bloc_demo/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_demo/bloc/switch_example/switch_event.dart';
import 'package:bloc_demo/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatelessWidget {
  const SwitchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example 2',
        ),
        centerTitle: true,
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
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                    buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      debugPrint('Switch');
                      return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context.read<SwitchBloc>().add(EnableOrDisableNotifications());
                        },
                      );
                    })
                /* Switch(
                  value: true,
                  onChanged: (newValue) {},
                )*/
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) => previous.slider != current.slider,
                builder: (context, state) {
                  debugPrint('Container');
                  return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) => previous.slider != current.slider,
                builder: (context, state) {
                  debugPrint('Slider');
                  return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      debugPrint('$value');
                      context.read<SwitchBloc>().add(SliderEvent(slider: value));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
