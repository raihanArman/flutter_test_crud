import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    this.id,
    this.name,
    this.description,
  });

  final String? id;
  final String? name;
  final String? description;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];
}
