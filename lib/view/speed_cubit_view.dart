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
        title: const Text('Kripesh Poudel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Speed Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: distanceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Distance (meters)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Time (seconds)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<SpeedCubit, double>(
                    builder: (context, result) {
                      return Text(
                        'Speed: ${result.toStringAsFixed(2)} m/s',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      double distance =
                          double.tryParse(distanceController.text) ?? 0.0;
                      double time = double.tryParse(timeController.text) ?? 0.0;
                      context.read<SpeedCubit>().calculate(distance, time);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      'Calculate Speed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SpeedCubit>().reset();
                      distanceController.clear();
                      timeController.clear();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
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
