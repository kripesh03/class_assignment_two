import 'package:class_assignment_two/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();
  double result = 0.0;
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kripesh Poudel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Simple Interest Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Principal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Rate (%)',
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
                  labelText: 'Enter Time (Years)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Simple Interest: Rs. ${result.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  double principal =
                      double.tryParse(principalController.text) ?? 0.0;
                  double rate = double.tryParse(rateController.text) ?? 0.0;
                  double time = double.tryParse(timeController.text) ?? 0.0;
                  context
                      .read<SimpleInterestCubit>()
                      .calculate(principal, rate, time);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Calculate Simple Interest',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<SimpleInterestCubit>().reset();
                  principalController.clear();
                  rateController.clear();
                  timeController.clear();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
