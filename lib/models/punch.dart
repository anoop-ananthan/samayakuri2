class Punch {
  String punchtime;

  String doorName;
  bool ignore;

  Punch({
    this.punchtime,
    this.doorName,
    this.ignore,
  });

  factory Punch.fromJson(Map<String, dynamic> json) => Punch(
        punchtime: (json["punchtime"] as String),
        doorName: json["dname"],
        ignore: json["ignore"] == null ? null : json["ignore"],
      );

  Map<String, dynamic> toJson() => {
        "punchtime": punchtime,
        "dname": doorName,
        "ignore": ignore == null ? null : ignore,
      };
}
