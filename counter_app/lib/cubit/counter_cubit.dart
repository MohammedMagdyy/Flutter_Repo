import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_cardapp/cubit/counterstate.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrementState());

  //______________________________________________________________
  static CounterCubit get(context) => BlocProvider.of(context);
  //______________________________________________________________

  int teamAPoints = 0;
  int teamBPoints = 0;

  void incrementTeam({required int buttonNumber, required String teamName}) {
    if (teamName == "A") {
      teamAPoints += buttonNumber;
      emit(CounterAIncrementState());
    } else {
      teamBPoints += buttonNumber;
      emit(CounterBIncrementState());
    }
  }

  void resetValues({
    required int buttonNumberA,
    // required int buttonNumberB,
  }) {
    teamAPoints = buttonNumberA;
    teamBPoints = buttonNumberA;

    emit(ResetState());
  }
}
