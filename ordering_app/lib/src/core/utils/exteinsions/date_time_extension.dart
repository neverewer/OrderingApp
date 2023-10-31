import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  String dateToShortString() {
    final formatter = DateFormat('MMM d, yyyy', 'en');
    return formatter.format(this);
  }
}
