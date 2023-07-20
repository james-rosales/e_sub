import 'bloc.dart';
import 'package:bloc/bloc.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc(super.initialState) {
    on<PreviousReadingValueChanged>(_previousReadingValueChanged);
    on<CurrentReadingValueChanged>(_currentReadingValueChanged);
    on<VecoUsedKwhValueChanged>(_vecoUsedKwhValueChanged);
    on<VecoTotalBillValueChanged>(_vecoTotalBillValueChanged);
    on<OnCalculatePressed>(_onCalculatePressed);
  }

  void _previousReadingValueChanged(
      PreviousReadingValueChanged event, Emitter<CalculateState> emit) {
    emit(
      state.copyWith.previousReading(
        value: event.previousReading ?? '',
      ),
    );
  }

  void _currentReadingValueChanged(
      CurrentReadingValueChanged event, Emitter<CalculateState> emit) {
    emit(
      state.copyWith.currentReading(
        value: event.currentReading ?? '',
      ),
    );
  }

  void _vecoUsedKwhValueChanged(
      VecoUsedKwhValueChanged event, Emitter<CalculateState> emit) {
    emit(
      state.copyWith.vecoUsedkwh(
        value: event.vecoUsedKwh ?? '',
      ),
    );
  }

  void _vecoTotalBillValueChanged(
      VecoTotalBillValueChanged event, Emitter<CalculateState> emit) {
    emit(
      state.copyWith.vecoTotalBill(
        value: event.vecoTotalBill ?? '',
      ),
    );
  }

  void _onCalculatePressed(
      OnCalculatePressed event, Emitter<CalculateState> emit) {
    var billMonth;
    var submeterUsedKWH;
    var pesosPerKWH;
    String previousReading = state.previousReading.value;
    String currentReading = state.currentReading.value;
    String totalVECOkwh = state.vecoUsedkwh.value;
    String totalVECObill = state.vecoTotalBill.value;

    submeterUsedKWH =
        double.parse(currentReading) - double.parse(previousReading);
    pesosPerKWH = double.parse(totalVECObill) / double.parse(totalVECOkwh);
    billMonth = submeterUsedKWH * pesosPerKWH;
    emit(
      state.copyWith(
        billMonth: billMonth.toString(),
      ),
    );
  }
}
