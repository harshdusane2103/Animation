class PlanetsModel {
  String position, name, velocity, distance, description, color, img,one;
  bool like;

  PlanetsModel(
      {required this.like,
        required this.position,
        required this.name,
        required this.velocity,
        required this.distance,
        required this.description,
        required this.color,
        required this.img,
        required this.one,
      });

  factory PlanetsModel.fromJson(Map json) {
    return PlanetsModel(
      like: json['like'],
      position: json['position'],
      color: json['color'],
      name: json['name']??'',
      velocity: json['velocity'],
      distance: json['distance'],
      description: json['description'],
      img: json['img'],
      one: json['one']??'',
    );
  }
}