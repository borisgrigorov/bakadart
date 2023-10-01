class School {
  String id;
  String name;
  String schoolUrl;

  School({
    required this.id,
    required this.name,
    required this.schoolUrl,
  });

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as String,
      name: json['name'] as String,
      schoolUrl: json['schoolUrl'] as String,
    );
  }

  @override
  String toString() {
    return 'School{id: $id, name: $name, schoolUrl: $schoolUrl}';
  }
}
