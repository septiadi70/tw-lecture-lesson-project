
import 'package:bloc/bloc.dart';

class CounterAppCubit extends Cubit<int> {
  CounterAppCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}