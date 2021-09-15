

import 'package:intl/intl.dart';

extension StringExtension on String {

  String capitalize() => isNotEmpty
      ? substring(0,1).toUpperCase() + substring(1).toLowerCase()
      : this;

  String formatStringDateTime({required String pattern, String format= 'd MMMM, yyyy', String locale= 'fr'}){
    DateTime dateTimeFromString = DateFormat(pattern).parse(this);
    int seconds = dateTimeFromString.difference(DateTime.now()).inSeconds;
    int hours = dateTimeFromString.difference(DateTime.now()).inHours;
    if (seconds < 60) {
      return '$seconds ${locale.contains('fr')? 'secondes' : 'second'}';
    } else if (seconds >= 60 && seconds < 3600) {
      return '${DateTime.now().difference(dateTimeFromString).inMinutes.abs()} minutes';
    } else if (hours >= 1 && hours < 2) {
      return '${DateTime.now().difference(dateTimeFromString).inHours} ${locale.contains('fr')? 'hour' : 'heure'}';
    } else if (hours >= 2 && hours < 12) {
      return DateFormat('HH:mm','fr').format(dateTimeFromString);
    } else {
      return DateFormat(format, locale).format(dateTimeFromString);
    }
  }

  String moneyFormat({String device= '',int round= 1}) {
    NumberFormat numberFormat = NumberFormat("#,##0.${round>0?'0'*round:'0'}", "en_US");
    return isNotEmpty
        ? numberFormat.format(double.parse(this)) + "  " + device
        : '0.0';
  }

}