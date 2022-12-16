class Banners {
  Banners({
    required this.id,
    required this.image,
  });
  late final int id;
  late final String image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
