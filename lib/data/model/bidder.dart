class Bidder {
  Bidder(
      {required this.name,
      required this.image,
      required this.role,
      required this.rating,
      required this.color});
  late final String name;
  late final String image;
  late final String role;
  late final String rating;
  late final String color;

  Bidder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    role = json['role'];
    rating = json['rating'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['role'] = role;
    data['rating'] = rating;
    data['color'] = color;
    return data;
  }
}
