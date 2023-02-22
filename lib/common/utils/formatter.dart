import 'package:intl/intl.dart';

class Formatter {
  formatDate(String dates) {
    String inputDate = dates;
    DateTime date = DateTime.parse(inputDate);
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(date);
    return formattedDate;
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
