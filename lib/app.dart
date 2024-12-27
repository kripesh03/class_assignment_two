import 'package:class_assignment_two/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment_two/cubit/dashborad_cubit.dart';
import 'package:class_assignment_two/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_two/cubit/speed_cubit.dart';
import 'package:class_assignment_two/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AreaOfCircleCubit()),
        BlocProvider(create: (context) => SimpleInterestCubit()),
        BlocProvider(create: (context) => SpeedCubit()),
        BlocProvider(
            create: (context) => DashboardCubit(
                  context.read<AreaOfCircleCubit>(),
                  context.read<SimpleInterestCubit>(),
                  context.read<SpeedCubit>(),
                ))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardView(),
      ),
    );
  }
}
