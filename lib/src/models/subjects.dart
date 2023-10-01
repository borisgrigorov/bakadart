class SubjectInfo {
  String subjectId;
  String subjectName;
  String subjectAbbrev;
  String teacherId;
  String teacherName;
  String teacherAbbrev;
  String? teacherEmail;
  String? teacherWeb;
  String? teacherSchoolPhone;
  String? teacherHomePhone;
  String? teacherMobilePhone;

  SubjectInfo({
    required this.subjectId,
    required this.subjectName,
    required this.subjectAbbrev,
    required this.teacherId,
    required this.teacherName,
    required this.teacherAbbrev,
    required this.teacherEmail,
    required this.teacherWeb,
    this.teacherSchoolPhone,
    this.teacherHomePhone,
    this.teacherMobilePhone,
  });

  factory SubjectInfo.fromJson(Map<String, dynamic> json) {
    return SubjectInfo(
      subjectId: json['SubjectID'] as String,
      subjectName: json['SubjectName'] as String,
      subjectAbbrev: json['SubjectAbbrev'] as String,
      teacherId: json['TeacherID'] as String,
      teacherName: json['TeacherName'] as String,
      teacherAbbrev: json['TeacherAbbrev'] as String,
      teacherEmail: json['TeacherEmail'] as String?,
      teacherWeb: json['TeacherWeb'] as String?,
      teacherSchoolPhone: json['TeacherSchoolPhone'] as String?,
      teacherHomePhone: json['TeacherHomePhone'] as String?,
      teacherMobilePhone: json['TeacherMobilePhone'] as String?,
    );
  }

  @override
  String toString() {
    return 'SubjectInfo{subjectId: $subjectId, subjectName: $subjectName, subjectAbbrev: $subjectAbbrev, teacherId: $teacherId, teacherName: $teacherName, teacherAbbrev: $teacherAbbrev, teacherEmail: $teacherEmail, teacherWeb: $teacherWeb, teacherSchoolPhone: $teacherSchoolPhone, teacherHomePhone: $teacherHomePhone, teacherMobilePhone: $teacherMobilePhone}';
  }
}
