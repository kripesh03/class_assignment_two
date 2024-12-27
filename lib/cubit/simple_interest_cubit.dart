
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0.0);

  void calculate(double principal, double rate, double time) {
    double interest = (principal * rate * time) / 100;
    emit(interest);
  }

  void reset() {
    emit(0.0);
  }
}
