DateTime dateOnlyLocal(DateTime d) => DateTime(d.year, d.month, d.day);

int epochDayFromDate(DateTime d) {
  final local = dateOnlyLocal(d);
  return local.difference(DateTime(1970)).inDays;
}

DateTime dateFromEpochDay(int epochDay) =>
    DateTime(1970).add(Duration(days: epochDay));
