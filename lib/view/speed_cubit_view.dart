import 'package:class_assignment_two/cubit/speed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeedCalculatorView extends StatelessWidget {
  const SpeedCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final distanceController = TextEditingController();
    final timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: distanceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Distance (meters)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Time (seconds)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<SpeedCubit, double>(
                    builder: (context, result) {
                      return Text(
                        'Speed: ${result.toString()} m/s',
                        style: const TextStyle(fontSize: 20),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        double distance =
                            double.tryParse(distanceController.text) ?? 0.0;
                        double time =
                            double.tryParse(timeController.text) ?? 0.0;
                        context.read<SpeedCubit>().calculate(distance, time);
                      },
                      child: const Text('Calculate Speed'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SpeedCubit>().reset();
                        distanceController.clear();
                        timeController.clear();
                      },
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
