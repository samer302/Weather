import 'package:intl/intl.dart';

class DateUtils{
  static String formatDate(String date) {
    return DateFormat.MMMEd().format(DateTime.parse(date)) +
        '\n' +
        DateFormat.jm().format(DateTime.parse(date));
}}