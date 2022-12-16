class Category {
  Category({
    required this.title,
    required this.image,
  });
  late final String title;
  late final String image;
  
  Category.fromJson(Map<String, dynamic> json){
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}