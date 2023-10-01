class Absence {
  DateTime date;
  int unsolved;
  int ok;
  int missed;
  int late;
  int soon;
  int school;
  int distanceTeaching;

  Absence({
    required this.date,
    required this.unsolved,
    required this.ok,
    required this.missed,
    required this.late,
    required this.soon,
    required this.school,
    required this.distanceTeaching,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    // Parse the "Date" field into a DateTime
    DateTime date = DateTime.parse(json['Date']);

    return Absence(
      date: date,
      unsolved: json['Unsolved'] as int,
      ok: json['Ok'] as int,
      missed: json['Missed'] as int,
      late: json['Late'] as int,
      soon: json['Soon'] as int,
      school: json['School'] as int,
      distanceTeaching: json['DistanceTeaching'] as int,
    );
  }

  @override
  String toString() {
    return 'Absence{date: $date, unsolved: $unsolved, ok: $ok, missed: $missed, late: $late, soon: $soon, school: $school, distanceTeaching: $distanceTeaching}';
  }
}

class AbsencePerSubject {
  String subjectName;
  int lessonsCount;
  int base;
  int late;
  int soon;
  int school;
  int distanceTeaching;

  AbsencePerSubject({
    required this.subjectName,
    required this.lessonsCount,
    required this.base,
    required this.late,
    required this.soon,
    required this.school,
    required this.distanceTeaching,
  });

  factory AbsencePerSubject.fromJson(Map<String, dynamic> json) {
    return AbsencePerSubject(
      subjectName: json['SubjectName'] as String,
      lessonsCount: json['LessonsCount'] as int,
      base: json['Base'] as int,
      late: json['Late'] as int,
      soon: json['Soon'] as int,
      school: json['School'] as int,
      distanceTeaching: json['DistanceTeaching'] as int,
    );
  }

  @override
  String toString() {
    return 'AbsencePerSubject{subjectName: $subjectName, lessonsCount: $lessonsCount, base: $base, late: $late, soon: $soon, school: $school, distanceTeaching: $distanceTeaching}';
  }
}

class AbsenceData {
  double percentageThreshold;
  List<Absence> absences;
  List<AbsencePerSubject> absencesPerSubject;

  AbsenceData({
    required this.percentageThreshold,
    required this.absences,
    required this.absencesPerSubject,
  });

  factory AbsenceData.fromJson(Map<String, dynamic> json) {
    // Parse the "Absences" list
    List<Absence> absencesList = (json['Absences'] as List)
        .map((absenceJson) => Absence.fromJson(absenceJson))
        .toList();

    // Parse the "AbsencesPerSubject" list
    List<AbsencePerSubject> absencesPerSubjectList =
        (json['AbsencesPerSubject'] as List)
            .map((absencePerSubjectJson) =>
                AbsencePerSubject.fromJson(absencePerSubjectJson))
            .toList();

    return AbsenceData(
      percentageThreshold: json['PercentageThreshold'] as double,
      absences: absencesList,
      absencesPerSubject: absencesPerSubjectList,
    );
  }

  @override
  String toString() {
    return 'AbsenceData{percentageThreshold: $percentageThreshold, absences: $absences, absencesPerSubject: $absencesPerSubject}';
  }
}
