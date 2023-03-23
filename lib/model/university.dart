class University {
  String name;
  String omCode;
  String baseUrl;

  University({required this.name, required this.omCode, required this.baseUrl});

  @override
  String toString() {
    return "$omCode - $name - $baseUrl\n";
  }
}