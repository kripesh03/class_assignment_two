import 'package:flutter_bloc/flutter_bloc.dart';


class SpeedCubit extends Cubit<double> {
  SpeedCubit() : super(0.0);

  void calculate(double distance, double time) {
    if (time > 0) {
      emit(distance / time);
    } else {
      emit(0.0); // zero bata divide huna rokna lai
    }
  }

  void reset() {
    emit(0.0);
  }
}
