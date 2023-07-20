// ignore: depend_on_referenced_packages
import 'package:e_sub/models/text_field_input/text_field_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculate_state.freezed.dart';

@freezed
class CalculateState with _$CalculateState {
  factory CalculateState({
    @Default(TextFieldInput()) TextFieldInput previousReading,
    @Default(TextFieldInput()) TextFieldInput currentReading,
    @Default(TextFieldInput()) TextFieldInput vecoUsedkwh,
    @Default(TextFieldInput()) TextFieldInput vecoTotalBill,
    @Default('0.00') String billMonth,
  }) = _CalculateState;
}
