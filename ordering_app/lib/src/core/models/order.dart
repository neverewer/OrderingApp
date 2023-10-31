import 'package:ordering_app/src/core/models/user.dart';

final class Order implements Comparable<Order> {
  final DateTime startDate;
  final User sender;
  final User recipient;

  Order({
    required this.startDate,
    required this.sender,
    required this.recipient,
  });

  @override
  int compareTo(Order other) => compareTo(other);

  Order copyWith({DateTime? startDate, User? sender, User? recipient}) {
    return Order(
      startDate: startDate ?? this.startDate,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Order) {
      return false;
    }
    if (other.startDate != startDate || other.sender != sender || other.recipient != recipient) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode => startDate.hashCode ^ sender.hashCode ^ recipient.hashCode;
}
