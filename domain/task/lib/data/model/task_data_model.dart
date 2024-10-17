class TaskDataModel {
  TaskDataModel({
    this.name,
    this.description,
    this.id,
  });

  final String? name;
  final String? description;
  final String? id;

  factory TaskDataModel.fromJson(Map<String, dynamic> json) => TaskDataModel(
        name: json["name"],
        description: json["description"],
        id: json["_id"],
      );
}
