import 'package:flutter/material.dart';

class SpeedCalculatorView extends StatefulWidget {
  const SpeedCalculatorView({super.key});

  @override
  State<SpeedCalculatorView> createState() => _SpeedCalculatorViewState();
}

class _SpeedCalculatorViewState extends State<SpeedCalculatorView> {
  final distanceController = TextEditingController();
  final timeController = TextEditingController();
  double result = 0.0;
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
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
              Text(
                'Speed: $result m/s',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Calculate Speed'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
