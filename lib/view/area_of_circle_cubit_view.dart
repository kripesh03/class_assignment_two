import 'package:class_assignment_two/cubit/area_of_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({super.key});

  @override
  State<AreaOfCircleView> createState() => _AreaOfCircleViewState();
}

class _AreaOfCircleViewState extends State<AreaOfCircleView> {
  final radiusController = TextEditingController(text: '');
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              TextFormField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter radius',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Result: ${result.toString()}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    double radius =
                        double.tryParse(radiusController.text) ?? 0.0;
                    context.read<AreaOfCircleCubit>().calculate(radius);
                  },
                  child: const Text('Calculate Area'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AreaOfCircleCubit>().reset();
                    radiusController.clear();
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
