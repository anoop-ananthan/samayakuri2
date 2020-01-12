class Punch {
  DateTime punchtime;
  int date;
  String doorName;
  bool ignore;

  Punch({
    this.punchtime,
    this.date,
    this.doorName,
    this.ignore,
  });

  factory Punch.fromJson(Map<String, dynamic> json) => Punch(
        punchtime: DateTime.parse(json["punchtime"]),
        date: json["date"],
        doorName: json["dname"],
        ignore: json["ignore"] == null ? null : json["ignore"],
      );

  Map<String, dynamic> toJson() => {
        "punchtime": punchtime.toIso8601String(),
        "date": date,
        "dname": doorName,
        "ignore": ignore == null ? null : ignore,
      };
}
