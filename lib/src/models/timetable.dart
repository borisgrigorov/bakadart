class Timetable {
  List<Hour> hours;
  List<Day> days;
  List<MyClass> classes;
  List<Group> groups;
  List<Subject> subjects;
  List<Teacher> teachers;
  List<Room> rooms;
  List<Cycle> cycles;

  Timetable({
    required this.hours,
    required this.days,
    required this.classes,
    required this.groups,
    required this.subjects,
    required this.teachers,
    required this.rooms,
    required this.cycles,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      hours: List<Hour>.from(json['Hours'].map((x) => Hour.fromJson(x))),
      days: List<Day>.from(json['Days'].map((x) => Day.fromJson(x))),
      classes:
          List<MyClass>.from(json['Classes'].map((x) => MyClass.fromJson(x))),
      groups: List<Group>.from(json['Groups'].map((x) => Group.fromJson(x))),
      subjects:
          List<Subject>.from(json['Subjects'].map((x) => Subject.fromJson(x))),
      teachers:
          List<Teacher>.from(json['Teachers'].map((x) => Teacher.fromJson(x))),
      rooms: List<Room>.from(json['Rooms'].map((x) => Room.fromJson(x))),
      cycles: List<Cycle>.from(json['Cycles'].map((x) => Cycle.fromJson(x))),
    );
  }

  @override
  String toString() {
    return 'Timetable{hours: $hours, days: $days, classes: $classes, groups: $groups, subjects: $subjects, teachers: $teachers, rooms: $rooms, cycles: $cycles}';
  }
}

class Hour {
  int id;
  String caption;
  String beginTime;
  String endTime;

  Hour(
      {required this.id,
      required this.caption,
      required this.beginTime,
      required this.endTime});

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      id: json['Id'] as int,
      caption: json['Caption'] as String,
      beginTime: json['BeginTime'] as String,
      endTime: json['EndTime'] as String,
    );
  }

  @override
  String toString() {
    return 'Hour{id: $id, caption: $caption, beginTime: $beginTime, endTime: $endTime}';
  }
}

class Atom {
  int hourId;
  List<String> groupIds;
  String? subjectId;
  String? teacherId;
  String? roomId;
  List<String> cycleIds;
  Change? change;
  List<dynamic> homeworkIds;
  String? theme;

  Atom({
    required this.hourId,
    required this.groupIds,
    required this.subjectId,
    required this.teacherId,
    required this.roomId,
    required this.cycleIds,
    required this.change,
    required this.homeworkIds,
    required this.theme,
  });

  factory Atom.fromJson(Map<String, dynamic> json) {
    return Atom(
      hourId: json['HourId'] as int,
      groupIds: List<String>.from(json['GroupIds'] as List<dynamic>),
      subjectId: json['SubjectId'],
      teacherId: json['TeacherId'],
      roomId: json['RoomId'],
      cycleIds: List<String>.from(json['CycleIds'] as List<dynamic>),
      change: json['Change'] == null ? null : Change.fromJson(json['Change']),
      homeworkIds: List<dynamic>.from(json['HomeworkIds'] as List<dynamic>),
      theme: json['Theme'],
    );
  }

  @override
  String toString() {
    return 'Atom{hourId: $hourId, groupIds: $groupIds, subjectId: $subjectId, teacherId: $teacherId, roomId: $roomId, cycleIds: $cycleIds, change: $change, homeworkIds: $homeworkIds, theme: $theme}';
  }
}

class Change {
  String? changeSubject;
  DateTime day;
  String hours;
  String changeType;
  String description;
  String time;
  String? typeAbbrev;
  String? typeName;

  Change({
    required this.changeSubject,
    required this.day,
    required this.hours,
    required this.changeType,
    required this.description,
    required this.time,
    required this.typeAbbrev,
    required this.typeName,
  });

  factory Change.fromJson(Map<String, dynamic> json) {
    DateTime day = DateTime.parse(json['Day']);

    return Change(
      changeSubject: json['ChangeSubject'],
      day: day,
      hours: json['Hours'] as String,
      changeType: json['ChangeType'] as String,
      description: json['Description'] as String,
      time: json['Time'] as String,
      typeAbbrev: json['TypeAbbrev'],
      typeName: json['TypeName'],
    );
  }

  @override
  String toString() {
    return 'Change{changeSubject: $changeSubject, day: $day, hours: $hours, changeType: $changeType, description: $description, time: $time, typeAbbrev: $typeAbbrev, typeName: $typeName}';
  }
}

class Day {
  List<Atom> atoms;
  int dayOfWeek;
  String date;
  String dayDescription;
  String dayType;

  Day({
    required this.atoms,
    required this.dayOfWeek,
    required this.date,
    required this.dayDescription,
    required this.dayType,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      atoms: List<Atom>.from(json['Atoms'].map((x) => Atom.fromJson(x))),
      dayOfWeek: json['DayOfWeek'] as int,
      date: json['Date'] as String,
      dayDescription: json['DayDescription'] as String,
      dayType: json['DayType'] as String,
    );
  }

  @override
  String toString() {
    return 'Day{atoms: $atoms, dayOfWeek: $dayOfWeek, date: $date, dayDescription: $dayDescription, dayType: $dayType}';
  }
}

class MyClass {
  String id;
  String abbrev;
  String name;

  MyClass({
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'MyClass{id: $id, abbrev: $abbrev, name: $name}';
  }
}

class Group {
  String classId;
  String id;
  String abbrev;
  String name;

  Group({
    required this.classId,
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      classId: json['ClassId'] as String,
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'Group{classId: $classId, id: $id, abbrev: $abbrev, name: $name}';
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

class Teacher {
  String id;
  String abbrev;
  String name;

  Teacher({
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'Teacher{id: $id, abbrev: $abbrev, name: $name}';
  }
}

class Room {
  String id;
  String abbrev;
  String name;

  Room({
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'Room{id: $id, abbrev: $abbrev, name: $name}';
  }
}

class Cycle {
  String id;
  String abbrev;
  String name;

  Cycle({
    required this.id,
    required this.abbrev,
    required this.name,
  });

  factory Cycle.fromJson(Map<String, dynamic> json) {
    return Cycle(
      id: json['Id'] as String,
      abbrev: json['Abbrev'] as String,
      name: json['Name'] as String,
    );
  }

  @override
  String toString() {
    return 'Cycle{id: $id, abbrev: $abbrev, name: $name}';
  }
}

class MyData {
  List<Hour> hours;
  List<Day> days;
  List<MyClass> classes;
  List<Group> groups;
  List<Subject> subjects;
  List<Teacher> teachers;
  List<Room> rooms;
  List<Cycle> cycles;

  MyData({
    required this.hours,
    required this.days,
    required this.classes,
    required this.groups,
    required this.subjects,
    required this.teachers,
    required this.rooms,
    required this.cycles,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      hours: List<Hour>.from(json['Hours'].map((x) => Hour.fromJson(x))),
      days: List<Day>.from(json['Days'].map((x) => Day.fromJson(x))),
      classes:
          List<MyClass>.from(json['Classes'].map((x) => MyClass.fromJson(x))),
      groups: List<Group>.from(json['Groups'].map((x) => Group.fromJson(x))),
      subjects:
          List<Subject>.from(json['Subjects'].map((x) => Subject.fromJson(x))),
      teachers:
          List<Teacher>.from(json['Teachers'].map((x) => Teacher.fromJson(x))),
      rooms: List<Room>.from(json['Rooms'].map((x) => Room.fromJson(x))),
      cycles: List<Cycle>.from(json['Cycles'].map((x) => Cycle.fromJson(x))),
    );
  }

  @override
  String toString() {
    return 'MyData{hours: $hours, days: $days, classes: $classes, groups: $groups, subjects: $subjects, teachers: $teachers, rooms: $rooms, cycles: $cycles}';
  }
}
