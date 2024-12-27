import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0.0);

  void calculate(double radius) {
    emit(3.14 * radius * radius);
  }

  void reset() {
    emit(0.0);
  }
}

