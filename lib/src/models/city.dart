class City {
  String name;
  int schoolCount;

  City({
    required this.name,
    required this.schoolCount,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String,
      schoolCount: json['schoolCount'] as int,
    );
  }

  @override
  String toString() {
    return 'City{name: $name, schoolCount: $schoolCount}';
  }
}
