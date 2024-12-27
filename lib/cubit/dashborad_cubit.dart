import 'package:class_assignment_two/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment_two/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_two/cubit/speed_cubit.dart';
import 'package:class_assignment_two/view/area_of_circle_cubit_view.dart';
import 'package:class_assignment_two/view/simple_interest_cubit_view.dart';
import 'package:class_assignment_two/view/speed_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  final AreaOfCircleCubit _areaOfCircleCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final SpeedCubit _speedCalculatorCubit;

  DashboardCubit(
    this._areaOfCircleCubit,
    this._simpleInterestCubit,
    this._speedCalculatorCubit,
  ) : super(null);

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: const AreaOfCircleView(),
        ),
      ),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: const SimpleInterestView(),
        ),
      ),
    );
  }

  void openSpeedCalculatorView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _speedCalculatorCubit,
          child: const SpeedCalculatorView(),
        ),
      ),
    );
  }
}
