class Job {
  Job({
    required this.title,
    required this.description,
    required this.image,
    required this.isCompleted,
    required this.tools,
    required this.duration,
    required this.price,
  });
  late final String title;
  late final String description;
  late final String image;
  late final bool isCompleted;
  late final int tools;
  late final int duration;
  late final int price;
  
  Job.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    image = json['image'];
    isCompleted = json['is_completed'];
    tools = json['tools'];
    duration = json['duration'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['is_completed'] = isCompleted;
    data['tools'] = tools;
    data['duration'] = duration;
    data['price'] = price;
    return data;
  }
}