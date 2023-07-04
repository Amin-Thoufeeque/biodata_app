class BioDataModel {
  int? id;

  final String name;

  final String age;

  final String place;

  final String content;

  BioDataModel(
      {required this.name,
      required this.age,
      this.id,
      required this.place,
      required this.content});

  static BioDataModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final place = map['place'] as String;
    final content = map['content'] as String;
    return BioDataModel(
        name: name, age: age, place: place, content: content, id: id);
  }
}
