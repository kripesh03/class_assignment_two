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
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Principal',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Rate (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Time (Years)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Simple Interest: Rs. ${result.toString()}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    double principal =
                        double.tryParse(principalController.text) ?? 0.0;
                    double rate = double.tryParse(rateController.text) ?? 0.0;
                    double time = double.tryParse(timeController.text) ?? 0.0;
                    context
                        .read<SimpleInterestCubit>()
                        .calculate(principal, rate, time);
                  },
                  child: const Text('Calculate Simple Interest'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SimpleInterestCubit>().reset();
                    principalController.clear();
                    rateController.clear();
                    timeController.clear();
                  },
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
