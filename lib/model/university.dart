class University {
  String name;
  String omCode;
  String baseUrl;

  University({required this.name, required this.omCode, required this.baseUrl});

  University.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      omCode = json["omCode"],
      baseUrl = json["baseUrl"];

  Map<String, dynamic> toJson() => {
    "name": name,
    "omCode": omCode,
    "baseUrl": baseUrl
  };

  @override
  String toString() {
    return "$omCode - $name - $baseUrl\n";
  }
}