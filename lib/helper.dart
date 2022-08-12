class Helper {
  Helper({this.year, this.month});
  int? year;
  int? month;
  List<dynamic> getCal() {
    var date = DateTime(year!, month! + 1, 0);
    var lasthMonth = DateTime(year!, (month! - 1) + 1, 0);
    var firstDate = DateTime(year!, month!, 1);
    //print(date.day);
    //print(firstDate.weekday);
    int lastDay = 0;
    var monthdata = [];
    for (var i = 1; i <= 5; i++) {
      var week = [];
      if (firstDate.weekday == 7) {
        for (var j = 1; j <= 7; j++) {
          week.add(DateTime(year!, month!, j + lastDay));
        }
        lastDay = week.last.day;
      } else {
        if (i == 1) {
          for (var j = 0; j < firstDate.weekday; j++) {
            week.add(DateTime(year!, month! - 1,
                lasthMonth.day - (firstDate.weekday - j - 1)));
          }
          for (var j = 1; j <= 7 - firstDate.weekday; j++) {
            week.add(DateTime(year!, month!, j));
          }
        } else {
          int lastpos = 0;
          for (var j = 1; j <= 7; j++) {
            if ((j + lastDay) < date.day) {
              week.add(DateTime(year!, month!, j + lastDay));
            } else if ((j + lastDay) == date.day) {
              week.add(DateTime(year!, month!, j + lastDay));
              lastpos = j;
            } else {
              week.add(DateTime(year!, month! + 1, j - lastpos));
            }
          }
        }

        lastDay = week.last.day;
      }
      monthdata.add(week);
    }
    return monthdata;
  }

  String parseMonth(int month) {
    String _name = "";
    switch (month) {
      case 1:
        _name = "Januari";
        break;
      case 2:
        _name = "Februari";
        break;
      case 3:
        _name = "Maret";
        break;
      case 4:
        _name = "April";
        break;
      case 5:
        _name = "Mei";
        break;
      case 6:
        _name = "Juni";
        break;
      case 7:
        _name = "Juli";
        break;
      case 8:
        _name = "Agustus";
        break;
      case 9:
        _name = "September";
        break;
      case 10:
        _name = "Oktober";
        break;
      case 11:
        _name = "November";
        break;
      case 12:
        _name = "Desember";
        break;
      default:
    }
    return _name;
  }
}
