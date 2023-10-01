class UserInfo {
  String userId;
  ClassInfo classinfo;
  String fullName;
  String userType;
  String userTypeText;
  int studyYear;

  UserInfo({
    required this.userId,
    required this.classinfo,
    required this.fullName,
    required this.userType,
    required this.userTypeText,
    required this.studyYear,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json["UserUID"],
      classinfo: ClassInfo.fromJson(json["Class"]),
      fullName: json["FullName"],
      userType: json["UserType"],
      userTypeText: json["UserTypeText"],
      studyYear: json["StudyYear"],
    );
  }

  @override
  String toString() {
    return "UserInfo(userId: $userId, classinfo: ${classinfo.toString()}, fullName: $fullName, userType: $userType, userTypeText: $userTypeText, studyYear: $studyYear)";
  }
}

class ClassInfo {
  String id;
  String abbrev;
  String? name;

  ClassInfo({
    required this.id,
    required this.abbrev,
    this.name,
  });

  factory ClassInfo.fromJson(Map<String, dynamic> json) {
    return ClassInfo(
      id: json["Id"],
      abbrev: json["Abbrev"],
      name: json["Name"],
    );
  }

  @override
  String toString() {
    return "ClassInfo(id: $id, abbrev: $abbrev, name: $name)";
  }
}
