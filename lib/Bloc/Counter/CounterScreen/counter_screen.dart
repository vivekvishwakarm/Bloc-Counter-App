import 'package:bloc_api_app/Bloc/Counter/counter_bloc.dart';
import 'package:bloc_api_app/Bloc/Counter/counter_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_event.dart';

class CounterPage extends StatelessWidget {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter App using Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using BlocConsumer to listen and build the UI
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text(
                    state.count.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                } else if (state is CounterIncrementState) {
                  return Text(
                    state.incCount.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                } else if (state is CounterDecrementState) {
                  return Text(
                    state.decCount.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                } else {
                  return const Text(
                    'Unknown state',
                    style: TextStyle(fontSize: 50),
                  );
                }
              },
              listener: (context, state) {
                if (state is CounterIncrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Increment button tapped"),
                    ),
                  );
                }

                if (state is CounterDecrementState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Decrement button tapped"),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(
                      CounterIncrementEvent(incCount: count++),
                    );
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(
                      CounterDecrementEvent(decCount: count--),
                    );
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







// BlocListener<CounterBloc, CounterState>(
      // listener: (context, state) {
      //   if (state is CounterIncrementState) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text("Incre btn tap"),
      //       ),
      //     );
      //   }
      //
      //   if (state is CounterDecrementState) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text("Decre btn tap"),
      //       ),
      //     );
      //   }
      //
      // },



              // BlocBuilder<CounterBloc, CounterState>(
              //   builder: (context, state) {
              //     if (state is CounterInitialState) {
              //       return Text(
              //         state.count.toString(),
              //         style: const TextStyle(fontSize: 50),
              //       );
              //     } else if (state is CounterIncrementState) {
              //       return Text(
              //         state.incCount.toString(),
              //         style: const TextStyle(fontSize: 50),
              //       );
              //     } else if (state is CounterDecrementState) {
              //       return Text(
              //         state.decCount.toString(),
              //         style: const TextStyle(fontSize: 50),
              //       );
              //     } else {
              //       // Add fallback to avoid returning null
              //       return const Text(
              //         'Unknown state',
              //         style: TextStyle(fontSize: 50),
              //       );
              //     }
              //   },
              // ),
