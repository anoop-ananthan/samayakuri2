import 'package:intl/intl.dart';

class Punch {
  DateTime punchtime;

  String doorName;
  bool ignore;

  Punch({
    this.punchtime,
    this.doorName,
    this.ignore,
  });

  factory Punch.fromJson(Map<String, dynamic> json) => Punch(
        punchtime: DateTime.parse(json["punchtime"]),
        doorName: json["dname"],
        ignore: json["ignore"] == null ? null : json["ignore"],
      );

  Map<String, dynamic> toJson() => {
        "punchtime": punchtime,
        "dname": doorName,
        "ignore": ignore == null ? null : ignore,
      };

  @override
  String toString() {
    try {
      return '${this.doorName}, ${DateFormat('h:mm').format(this.punchtime)}';
    } catch (e) {
      return 'Eror ';
    }
  }
}
