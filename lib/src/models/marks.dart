class Mark {
  DateTime markDate;
  DateTime editDate;
  String caption;
  String theme;
  String markText;
  String teacherId;
  String type;
  String typeNote;
  int? weight;
  String subjectId;
  bool isNew;
  bool isPoints;
  String calculatedMarkText;
  String? classRankText;
  String id;
  String pointsText;
  int maxPoints;

  Mark({
    required this.markDate,
    required this.editDate,
    required this.caption,
    required this.theme,
    required this.markText,
    required this.teacherId,
    required this.type,
    required this.typeNote,
    this.weight,
    required this.subjectId,
    required this.isNew,
    required this.isPoints,
    required this.calculatedMarkText,
    this.classRankText,
    required this.id,
    required this.pointsText,
    required this.maxPoints,
  });

  factory Mark.fromJson(Map<String, dynamic> json) {
    return Mark(
      markDate: DateTime.parse(json['MarkDate']),
      editDate: DateTime.parse(json['EditDate']),
      caption: json['Caption'] as String,
      theme: json['Theme'] as String,
      markText: json['MarkText'] as String,
      teacherId: json['TeacherId'] as String,
      type: json['Type'] as String,
      typeNote: json['TypeNote'] as String,
      weight: json['Weight'] as int?,
      subjectId: json['SubjectId'] as String,
      isNew: json['IsNew'] as bool,
      isPoints: json['IsPoints'] as bool,
      calculatedMarkText: json['CalculatedMarkText'] as String,
      classRankText: json['ClassRankText'] as String?,
      id: json['Id'] as String,
      pointsText: json['PointsText'] as String,
      maxPoints: json['MaxPoints'] as int,
    );
  }

  @override
  String toString() {
    return 'Mark{markDate: $markDate, editDate: $editDate, caption: $caption, theme: $theme, markText: $markText, teacherId: $teacherId, type: $type, typeNote: $typeNote, weight: $weight, subjectId: $subjectId, isNew: $isNew, isPoints: $isPoints, calculatedMarkText: $calculatedMarkText, classRankText: $classRankText, id: $id, pointsText: $pointsText, maxPoints: $maxPoints}';
  }
}

class Subject {
  String id;
  String abbrev;
  String name;

  Subject({
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'Subject{id: $id, abbrev: $abbrev, name: $name}';
  }
}

class SubjectWithMarks {
  List<Mark> marks;
  Subject subject;
  String averageText;
  String temporaryMark;
  String subjectNote;
  String temporaryMarkNote;
  bool pointsOnly;
  bool markPredictionEnabled;

  SubjectWithMarks({
    required this.marks,
    required this.subject,
    required this.averageText,
    required this.temporaryMark,
    required this.subjectNote,
    required this.temporaryMarkNote,
    required this.pointsOnly,
    required this.markPredictionEnabled,
  });

  factory SubjectWithMarks.fromJson(Map<String, dynamic> json) {
    // Parse the "Marks" list
    List<Mark> marksList = (json['Marks'] as List)
        .map((markJson) => Mark.fromJson(markJson))
        .toList();

    // Parse the "Subject" object
    Subject subject = Subject.fromJson(json['Subject']);

    return SubjectWithMarks(
      marks: marksList,
      subject: subject,
      averageText: json['AverageText'] as String,
      temporaryMark: json['TemporaryMark'] as String,
      subjectNote: json['SubjectNote'] as String,
      temporaryMarkNote: json['TemporaryMarkNote'] as String,
      pointsOnly: json['PointsOnly'] as bool,
      markPredictionEnabled: json['MarkPredictionEnabled'] as bool,
    );
  }

  @override
  String toString() {
    return 'SubjectWithMarks{marks: $marks, subject: $subject, averageText: $averageText, temporaryMark: $temporaryMark, subjectNote: $subjectNote, temporaryMarkNote: $temporaryMarkNote, pointsOnly: $pointsOnly, markPredictionEnabled: $markPredictionEnabled}';
  }
}

class MarksData {
  List<SubjectWithMarks> subjects;

  MarksData({
    required this.subjects,
  });

  factory MarksData.fromJson(Map<String, dynamic> json) {
    // Parse the "Subjects" list
    List<SubjectWithMarks> subjectsList = (json['Subjects'] as List)
        .map((subjectJson) => SubjectWithMarks.fromJson(subjectJson))
        .toList();

    return MarksData(
      subjects: subjectsList,
    );
  }

  @override
  String toString() {
    return 'MarksData{subjects: $subjects}';
  }
}
