import 'package:class_assignment_two/view/area_of_circle_cubit_view.dart';
import 'package:class_assignment_two/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleInterestView(),
    );
  }
}
