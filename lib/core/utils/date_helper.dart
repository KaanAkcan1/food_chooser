import 'package:intl/intl.dart';

class DateHelper {
  // Tarih formatını döndürür
  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }

  // String tarih formatını DateTime objesine çevirir
  static DateTime parseDate(String dateStr) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.parse(dateStr);
  }
}
