class JobMatch {
  JobMatch({
    required this.title,
    required this.description,
    required this.image,
    required this.tools,
    required this.watchers,
    required this.likes,
  });
  late final String title;
  late final String description;
  late final String image;
  late final int tools;
  late final int watchers;
  late final int likes;
  
  JobMatch.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    image = json['image'];
    tools = json['tools'];
    watchers = json['watchers'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['tools'] = tools;
    data['watchers'] = watchers;
    data['likes'] = likes;
    return data;
  }
}