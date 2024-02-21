class Subject {
  String name;
  int totalClass;
  int attendedClass;
  Map<String, dynamic> marks;

  Subject(
      {required this.name,
      required this.totalClass,
      required this.attendedClass,
      required this.marks});
}
