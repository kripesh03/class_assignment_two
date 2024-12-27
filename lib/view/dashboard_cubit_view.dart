import 'package:class_assignment_two/cubit/dashborad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Kripesh Poudel'),
            Text(
              'Class Assignment Two',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 12,
        ),
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                context.read<DashboardCubit>().openAreaOfCircleView(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.circle_outlined, size: 48),
                  Text('Area of Circle'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                context.read<DashboardCubit>().openSimpleInterestView(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.monetization_on_outlined, size: 48),
                  Text('Simple Interest'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                context.read<DashboardCubit>().openSpeedCalculatorView(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.speed, size: 48),
                  Text('Speed'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
