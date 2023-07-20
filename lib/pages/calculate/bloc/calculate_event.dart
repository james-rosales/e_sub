abstract class CalculateEvent {
  const CalculateEvent();
}

class PreviousReadingValueChanged extends CalculateEvent {
  final String? previousReading;

  const PreviousReadingValueChanged(this.previousReading);
}

class CurrentReadingValueChanged extends CalculateEvent {
  final String? currentReading;

  const CurrentReadingValueChanged(this.currentReading);
}

class VecoUsedKwhValueChanged extends CalculateEvent {
  final String? vecoUsedKwh;

  const VecoUsedKwhValueChanged(this.vecoUsedKwh);
}

class VecoTotalBillValueChanged extends CalculateEvent {
  final String? vecoTotalBill;

  const VecoTotalBillValueChanged(this.vecoTotalBill);
}

class OnCalculatePressed extends CalculateEvent {
  const OnCalculatePressed();
}
