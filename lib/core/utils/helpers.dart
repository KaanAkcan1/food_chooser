import 'package:intl/intl.dart';

class Helpers {
  // Tarih formatlama fonksiyonu
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  // Error handling
  static String handleError(Exception error) {
    return "Error: ${error.toString()}";
  }
}
